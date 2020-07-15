
. ./tests/lib.sh


# Signing valid multi-input tx should pass - 1

# wallet get-capacity --lock-arg 0x8d5520741f06a062543cdea9a21fc20d07ee29b0
# total: 899.997 (CKB)
# wallet get-capacity --address ckt1qyqw2fsdswd8s6kz4yy3s80e5s3lrma7sc7spdxnqe
# total: 1000.0 (CKB) "m/44'/309'/0'/0/0"
# wallet transfer --from-account 0x8d5520741f06a062543cdea9a21fc20d07ee29b0 --to-address ckt1qyqwggd90hnw6kqp39rrzvwvkm2cg0dtjawspc6k35 --capacity 1500 --tx-fee 0.0001  --derive-change-address ckt1qyqgx33w4lvn7zje32ext9l9ekn9ywe0c9fsay4tw4 --derive-change-address-length 5

# Input Cells of transactions
# transaction:
#   version: 0
#   cell_deps:
#     - out_point:
#         tx_hash: 0x01ef8910ef4e71349763523a077eea304b0e852c45b04d5b56c482306f4f6d93
#         index: 0
#       dep_type: dep_group
#   header_deps: []
#   inputs:
#     - since: 0x0 (absolute block(0))
#       previous_output:
#         tx_hash: 0x276d5447f20df863b13bcafd63de2ad851e4f35eda337268b19ab0cf7c29c608
#         index: 1
#     - since: 0x0 (absolute block(0))
#       previous_output:
#         tx_hash: 0x40e54fc2d1aabbd39ae6cd8a5df922995dd856f24f670d3d5f283690a534a544
#         index: 0
#   outputs:
#     - capacity: "300.0"
#       lock:
#         code_hash: 0x5c5069eb0857efc65e1bca0c07df34c31663b3622fd3876c876320fc9634e2a8 (multisig)
#         args: 0x98ac6e82110a9ef50923375bfdcbef6fd979b8ac6000003804080720
#         hash_type: type
#       type: ~
#     - capacity: "899.997"
#       lock:
#         code_hash: 0x9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8 (sighash)
#         args: 0x8d5520741f06a062543cdea9a21fc20d07ee29b0
#         hash_type: type
#       type: ~
#   outputs_data:
#     - 0x
#     - 0x
#   witnesses:
#     - 0x5500000010000000550000005500000041000000ad2eee29bd91556d68b6313ea8957cf2ae3eb8266241897147486f4a6464171615855e59af5a763a82296886d3c22628fc1aed94e55b1ee050661618c588144c00
#     - 0x
#   hash: 0x6127c3e68295fb18d6ed55256f5ac3bb81c3446c671ff029db7ad7992bc7b394

# transaction:
#   version: 0
#   cell_deps:
#     - out_point:
#         tx_hash: 0x01ef8910ef4e71349763523a077eea304b0e852c45b04d5b56c482306f4f6d93
#         index: 0
#       dep_type: dep_group
#   header_deps: []
#   inputs:
#     - since: 0x0 (absolute block(0))
#       previous_output:
#         tx_hash: 0x39738e9ad7b3ac419a51a9d301cb96722d3e01f2ffbae7779bd31791fc24adad
#         index: 1
#   outputs:
#     - capacity: "1000.0"
#       lock:
#         code_hash: 0x9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8 (sighash)
#         args: 0xe5260d839a786ac2a909181df9a423f1efbe863d
#         hash_type: type
#       type: ~
#     - capacity: "19999983549.9828"
#       lock:
#         code_hash: 0x9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8 (sighash)
#         args: 0xcc4e78b857b8ea477304925ac0f67b7348b86761
#         hash_type: type
#       type: ~
#   outputs_data:
#     - 0x
#     - 0x
#   witnesses:
#     - 0x55000000100000005500000055000000410000002e5b82f6892bfacc4c4326079fa5117de6b0a227da3ab6c4d3bd837837cf13830ad652472329e12301d52364cc5df64ee81d7adfd00c36f16bdc69f643740ffb00
#   hash: 0xdccc65d2b03f6b30d8cb48a3ab630ac26c73257557ce62320cc911a02fb816b4

# Transaction being signed
# version: 0
# cell_deps:
#   - out_point:
#       tx_hash: 0x01ef8910ef4e71349763523a077eea304b0e852c45b04d5b56c482306f4f6d93
#       index: 0
#     dep_type: dep_group
# header_deps: []
# inputs:
#   - since: 0x0 (absolute block(0))
#     previous_output:
#       tx_hash: 0x6127c3e68295fb18d6ed55256f5ac3bb81c3446c671ff029db7ad7992bc7b394
#       index: 1
#   - since: 0x0 (absolute block(0))
#     previous_output:
#       tx_hash: 0xdccc65d2b03f6b30d8cb48a3ab630ac26c73257557ce62320cc911a02fb816b4
#       index: 0
# outputs:
#   - capacity: "1500.0"
#     lock:
#       code_hash: 0x9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8 (sighash)
#       args: 0xe421a57de6ed580189463131ccb6d5843dab975d
#       hash_type: type
#     type: ~
#   - capacity: "399.9969"
#     lock:
#       code_hash: 0x9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8 (sighash)
#       args: 0x83462eafd93f0a598ab26597e5cda6523b2fc153
#       hash_type: type
#     type: ~
# outputs_data:
#   - 0x
#   - 0x
# witnesses:
#   - 0x5500000010000000550000005500000041000000456049d307a11353d7520d1756c38ef6bcb20b00cc90536420768cb6e08916475ceed3b38f8f05481f2d2b7deba4fd3335e22495c00a8d7f8715a4258378cdfe00
#   - 0x55000000100000005500000055000000410000007766519eed01f9534e44b03b0fcc0bcd7bbc1d96f7fb9373707e260df27739f15c07811508ef5b460f5e09773c62436ea0ccff4c564aff3d561c7a097e1a186901
# hash: 0x38e181c8cd1f37c737837675e67e80054f129b962e301fcecacbf59d6531659a

@test "Signing valid multi-input tx should pass - 1 - (Input 1)" {
  run sendTransaction f504000018000000280000004000000044000000e1040000030000002c0000803501008000000080050000002c00008035010080000000800100000000000000020000009d0400001c00000020000000490000004d000000bb03000089040000000000000100000001ef8910ef4e71349763523a077eea304b0e852c45b04d5b56c482306f4f6d930000000001000000006e0300000c000000d7010000cb0100000c0000003800000000000000000000006127c3e68295fb18d6ed55256f5ac3bb81c3446c671ff029db7ad7992bc7b39401000000930100001c00000020000000490000004d000000a90000007f010000000000000100000001ef8910ef4e71349763523a077eea304b0e852c45b04d5b56c482306f4f6d93000000000100000000020000000000000000000000276d5447f20df863b13bcafd63de2ad851e4f35eda337268b19ab0cf7c29c60801000000000000000000000040e54fc2d1aabbd39ae6cd8a5df922995dd856f24f670d3d5f283690a534a54400000000d60000000c000000750000006900000010000000180000006900000000ac23fc06000000510000001000000030000000310000005c5069eb0857efc65e1bca0c07df34c31663b3622fd3876c876320fc9634e2a8011c00000098ac6e82110a9ef50923375bfdcbef6fd979b8ac600000380408072061000000100000001800000061000000207066f414000000490000001000000030000000310000009bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce801140000008d5520741f06a062543cdea9a21fc20d07ee29b0140000000c000000100000000000000000000000970100000c000000380000000000000000000000dccc65d2b03f6b30d8cb48a3ab630ac26c73257557ce62320cc911a02fb816b4000000005f0100001c00000020000000490000004d0000007d0000004b010000000000000100000001ef8910ef4e71349763523a077eea304b0e852c45b04d5b56c482306f4f6d9300000000010000000001000000000000000000000039738e9ad7b3ac419a51a9d301cb96722d3e01f2ffbae7779bd31791fc24adad01000000ce0000000c0000006d0000006100000010000000180000006100000000e8764817000000490000001000000030000000310000009bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce80114000000e5260d839a786ac2a909181df9a423f1efbe863d6100000010000000180000006100000040bf094de86bc11b490000001000000030000000310000009bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce80114000000cc4e78b857b8ea477304925ac0f67b7348b86761140000000c000000100000000000000000000000ce0000000c0000006d00000061000000100000001800000061000000005cb2ec22000000490000001000000030000000310000009bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce80114000000e421a57de6ed580189463131ccb6d5843dab975d6100000010000000180000006100000010d52a5009000000490000001000000030000000310000009bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8011400000083462eafd93f0a598ab26597e5cda6523b2fc153140000000c000000100000000000000000000000140000000c000000100000000000000000000000
  promptsCheck 6 tests/sign-valid-multi-input-tx-1-prompts.txt
  rv="$(egrep "<= b'.*'9000" <(echo "$output")|cut -d"'" -f2)"
  txhash_and_witness=38e181c8cd1f37c737837675e67e80054f129b962e301fcecacbf59d6531659a5500000000000000550000001000000055000000550000004100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
  run check_signature "038000002c8000013580000000" "$txhash_and_witness" "$rv"
  diff <(echo $output) - <<<"Signature Verified Successfully"
}


@test "Signing valid multi-input tx should pass - 1 - (Input 2)" {
  run sendTransaction fd0400001800000030000000480000004c000000e9040000050000002c00008035010080000000800000000000000000050000002c00008035010080000000800100000000000000020000009d0400001c00000020000000490000004d000000bb03000089040000000000000100000001ef8910ef4e71349763523a077eea304b0e852c45b04d5b56c482306f4f6d930000000001000000006e0300000c000000d7010000cb0100000c0000003800000000000000000000006127c3e68295fb18d6ed55256f5ac3bb81c3446c671ff029db7ad7992bc7b39401000000930100001c00000020000000490000004d000000a90000007f010000000000000100000001ef8910ef4e71349763523a077eea304b0e852c45b04d5b56c482306f4f6d93000000000100000000020000000000000000000000276d5447f20df863b13bcafd63de2ad851e4f35eda337268b19ab0cf7c29c60801000000000000000000000040e54fc2d1aabbd39ae6cd8a5df922995dd856f24f670d3d5f283690a534a54400000000d60000000c000000750000006900000010000000180000006900000000ac23fc06000000510000001000000030000000310000005c5069eb0857efc65e1bca0c07df34c31663b3622fd3876c876320fc9634e2a8011c00000098ac6e82110a9ef50923375bfdcbef6fd979b8ac600000380408072061000000100000001800000061000000207066f414000000490000001000000030000000310000009bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce801140000008d5520741f06a062543cdea9a21fc20d07ee29b0140000000c000000100000000000000000000000970100000c000000380000000000000000000000dccc65d2b03f6b30d8cb48a3ab630ac26c73257557ce62320cc911a02fb816b4000000005f0100001c00000020000000490000004d0000007d0000004b010000000000000100000001ef8910ef4e71349763523a077eea304b0e852c45b04d5b56c482306f4f6d9300000000010000000001000000000000000000000039738e9ad7b3ac419a51a9d301cb96722d3e01f2ffbae7779bd31791fc24adad01000000ce0000000c0000006d0000006100000010000000180000006100000000e8764817000000490000001000000030000000310000009bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce80114000000e5260d839a786ac2a909181df9a423f1efbe863d6100000010000000180000006100000040bf094de86bc11b490000001000000030000000310000009bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce80114000000cc4e78b857b8ea477304925ac0f67b7348b86761140000000c000000100000000000000000000000ce0000000c0000006d00000061000000100000001800000061000000005cb2ec22000000490000001000000030000000310000009bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce80114000000e421a57de6ed580189463131ccb6d5843dab975d6100000010000000180000006100000010d52a5009000000490000001000000030000000310000009bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8011400000083462eafd93f0a598ab26597e5cda6523b2fc153140000000c000000100000000000000000000000140000000c000000100000000000000000000000
  promptsCheck 6 tests/sign-valid-multi-input-tx-2-prompts.txt
  rv="$(egrep "<= b'.*'9000" <(echo "$output")|cut -d"'" -f2)"
  txhash_and_witness=38e181c8cd1f37c737837675e67e80054f129b962e301fcecacbf59d6531659a5500000000000000550000001000000055000000550000004100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
  run check_signature "058000002c80000135800000000000000000000000" "$txhash_and_witness" "$rv"
  diff <(echo $output) - <<<"Signature Verified Successfully"
}