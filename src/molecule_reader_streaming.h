#ifndef MOLECULE_READER_H
#define MOLECULE_READER_H

// FIXME: remove
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

#ifndef MOL_PIC
#define MOL_PIC(x) x
#define MOL_PIC_STRUCT(t,x) x
#define mol_printf(...) fprintf(stderr, __VA_ARGS__)
#define mol_emerg_reject 0
#endif

#ifdef __cplusplus
#define _CPP_BEGIN extern "C" {
#define _CPP_END }
_CPP_BEGIN
#endif /* __cplusplus */

#include <stdbool.h>
#include <stdint.h>

#ifndef MOLECULE_API_DECORATOR
#define __DEFINE_MOLECULE_API_DECORATOR
#define MOLECULE_API_DECORATOR
#endif /* MOLECULE_API_DECORATOR */

#define MOLECULE_API_VERSION        5000
#define MOLECULEC_VERSION_MIN       5000

#if MOLECULE_API_VERSION < MOLECULE_API_VERSION_MIN
#error This file was generated by a newer version of moleculec which is \
    incompatible with current headers in use. Please update the headers.
#endif

#if MOLECULEC_VERSION < MOLECULEC_VERSION_MIN
#error This file was generated by an older version of moleculec which is \
    incompatible with current headers in use. Please regenerate this file \
    with a newer version of moleculec.
#endif

/*
 * This part is not for normal users.
 */

// Test if the host is big endian machine.
uint16_t le_test=1;
#define is_le()  true
//(*(unsigned char *)&le_test)

/*
 * Definitions of types and simple utilities.
 */

/* Core types */

typedef uint32_t                mol_num_t;          // Item Id

const mol_num_t MOL_NUM_MAX = (mol_num_t) -1;

typedef uint8_t                 mol_errno;          // Error Number

#define MolNum                  UINT32_C

#define MOL_NUM_T_SIZE          4

// Bytes segment.
typedef struct {
    mol_num_t                   size;               // Full size
    mol_num_t                   remaining;          // Remaining data
} mol_seg_t;

// Unpacked Union
typedef struct {
    mol_num_t                   item_id;            // Item Id
    mol_seg_t                   seg;                // Segment
} mol_union_t;

// Result for returning segment.
typedef struct {
    mol_errno                   errno;              // Error Number
    mol_seg_t                   seg;                // Segment
} mol_seg_res_t;

/* Error Numbers */

#define MOL_OK                              0x00
#define MOL_ERR                             0xff

#define MOL_ERR_TOTAL_SIZE                  0x01
#define MOL_ERR_HEADER                      0x02
#define MOL_ERR_OFFSET                      0x03
#define MOL_ERR_UNKNOWN_ITEM                0x04
#define MOL_ERR_INDEX_OUT_OF_BOUNDS         0x05
#define MOL_ERR_FIELD_COUNT                 0x06
#define MOL_ERR_DATA                        0x07

/* Utilities. */

MOLECULE_API_DECORATOR mol_num_t mol_unpack_number(const uint8_t *src) {
    if (is_le()) {
        uint32_t as_num;
        memcpy(&as_num, src, 4);
        return as_num;
    } else {
        uint32_t output = 0;
        uint8_t *dst = (uint8_t*) &output;
        dst[3] = src[0];
        dst[2] = src[1];
        dst[1] = src[2];
        dst[0] = src[3];
        return output;
    }
}


/*
 * Core functions.
 */

struct mol_chunk {
  uint8_t *ptr;
  mol_num_t length;
  mol_num_t consumed;
};

// Parse byte array

#define MAX_BYTES 32

struct bytes_state {
    mol_num_t fill;
    union {
       uint8_t bytes_buffer[32];
    };
};

// Synonym compatible to the above, but with mol_num_t-specific payload segment.
struct num_state {
    mol_num_t fill;
    union {
       mol_num_t bytes_as_num;
    };
};

typedef enum {
    INCOMPLETE,
    COMPLETE,
    REJECT
} mol_rv;

#define STACK_SIZE 256

struct state_stack {
    uint8_t stack[STACK_SIZE];
    uint8_t *stack_next;

    // Keep frame sizes around for debugging.
    uint8_t frame_sizes[10];
    int8_t frame_count;
};

struct state_stack the_stack;

// Byte parser
struct byte_state { };
struct byte_state_u { };
struct byte_callbacks { void (*end)(uint8_t); };

//MOLECULE_API_DECORATOR void MolReader_byte_init_state(struct byte_state* __attribute__((unused)) g, struct mol_chunk *chunk, struct byte_callbacks *cb) {
//}

#define MolReader_byte_init_state(a, b) (void)(a); (void)(b)// No init for byte

MOLECULE_API_DECORATOR mol_rv MolReader_byte_parse(
    struct byte_state* __attribute__((unused)) g,
    struct mol_chunk *chunk,
    const struct byte_callbacks *cb, mol_num_t size)
{
    if(size!=1) return REJECT;
    if(chunk->length>chunk->consumed) {
        if(cb && cb->end) MOL_PIC(cb->end)(chunk->ptr[chunk->consumed]);
        chunk->consumed++;
        return COMPLETE;
    }
    return INCOMPLETE;
}

struct bytes_callbacks {
    void (*end)(uint8_t*, mol_num_t);
};

MOLECULE_API_DECORATOR void mol_bytes_init_state(
    struct bytes_state* g,
    const struct bytes_callbacks __attribute__((unused)) *cb)
{
    memset(g, 0, sizeof(struct bytes_state));
}

MOLECULE_API_DECORATOR mol_rv mol_parse_bytes(
    struct bytes_state* g,
    struct mol_chunk *chunk,
    const struct bytes_callbacks *cb,
    mol_num_t total_size)
{
    mol_num_t available = chunk->length-chunk->consumed;
    mol_num_t needed = total_size - g->fill;

    mol_num_t copy_amount= needed<available?needed:available;

    memcpy(g->bytes_buffer+g->fill, chunk->ptr+chunk->consumed, copy_amount);
    g->fill+=copy_amount;
    chunk->consumed+=copy_amount;

    if(copy_amount == needed) {
        if(cb && cb->end) MOL_PIC(cb->end)(g->bytes_buffer, total_size);

    return COMPLETE;
    }
    return INCOMPLETE;
}

MOLECULE_API_DECORATOR mol_rv mol_parse_num(
    struct num_state* g,
    struct mol_chunk *chunk,
    uint32_t *dest)
{
    // mol_parse_bytes won't touch more than 4 bytes of payload when passed 4,
    // and num_state is equivalent for that long.
    mol_rv rv = mol_parse_bytes((struct bytes_state*) g, chunk, NULL, 4);
    if(rv == COMPLETE) *dest = mol_unpack_number((uint8_t*) &g->bytes_as_num);
    return rv;
}

#define state_init(name) MolReader_ ## name ## _state_init
#define parse(name) MolReader_ ## name ## _parse

void* alignment_fix(void* in) {
    return (void*)((((uint32_t)(in+3))/4)*4);
}

#define STATE_PUSH(state, item) &(state->u.item)

#define MOL_CALL_SUBPARSER(field, type, size) { \
    struct type ## _state *substate = STATE_PUSH(s, field); \
    mol_rv rv = MolReader_ ## type ## _parse( \
        substate, \
        chunk, \
        (cb ? MOL_PIC_STRUCT(struct type ## _callbacks, cb->field) : NULL), \
        size \
    ); \
    if(rv != COMPLETE) { \
        if(rv == REJECT) \
            mol_printf("Subparser for " #field " rejected; rejecting.\n"); \
        if(cb && cb->chunk) \
            MOL_PIC(cb->chunk)( \
                chunk->ptr + start_idx, \
                chunk->consumed - start_idx \
            ); \
        return rv; \
    } \
}

#define MOL_INIT_SUBPARSER(field, type) { \
    struct type ## _state *nextstate = STATE_PUSH(s, field); \
    MolReader_ ## type ## _init_state( \
        nextstate, \
        (cb ? MOL_PIC_STRUCT(struct type ## _callbacks, cb->field) : NULL) \
    ); \
}

MOLECULE_API_DECORATOR void mol_num_init_state(struct num_state* g, const struct bytes_callbacks __attribute__((unused)) *cb) {
    memset(g, 0, sizeof(struct num_state));
}
#define MOL_INIT_NUM() { \
    struct num_state *nextstate = STATE_PUSH(s, num); \
    mol_num_init_state(nextstate, NULL); \
}

#define MOL_CALL_NUM(var) { \
    struct num_state *substate = STATE_PUSH(s, num); \
    mol_rv rv = mol_parse_num(substate, chunk, &(var)); \
    if (rv != COMPLETE) { \
        if (cb && cb->chunk) \
            MOL_PIC(cb->chunk)( \
                chunk->ptr + start_idx, \
                chunk->consumed - start_idx \
            ); \
        return rv; \
    } \
}

#define DONE() do { \
      if(cb && cb->chunk) MOL_PIC(cb->chunk)(chunk->ptr + start_idx, chunk->consumed - start_idx); \
      if(cb && cb->end) MOL_PIC(cb->end)(); \
      return COMPLETE; \
  } while(0)


/*
 * Undef macros which are internal use only.
 */

#undef is_le

#ifdef __DEFINE_MOLECULE_API_DECORATOR
#undef MOLECULE_API_DECORATOR
#undef __DEFINE_MOLECULE_API_DECORATOR
#endif /* __DEFINE_MOLECULE_API_DECORATOR */

#ifdef __cplusplus
_CPP_END
#undef _CPP_BEGIN
#undef _CPP_END
#endif /* __cplusplus */

#endif /* MOLECULE_READER_H */
