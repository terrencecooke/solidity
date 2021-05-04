pragma abicoder v2;
contract C {
    event E(uint[][]);
    function createEvent(uint x) public {
        uint[][] memory arr = new uint[][](2);
        arr[0] = new uint[](2);
        arr[1] = new uint[](2);
        arr[0][0] = x;
        arr[0][1] = x + 1;
        arr[1][0] = x + 2;
        arr[1][1] = x + 3;
        emit E(arr);
    }
}
// ====
// compileViaYul: also
// ----
// createEvent(uint256): 42 ->
// - log[0]
// -   topic[0]: keccak256('E(uint256[][])')
// -    data[0]: 0000000000000000000000000000000000000000000000000000000000000020 (uint256[][])
// -    data[1]: 0000000000000000000000000000000000000000000000000000000000000002
// -    data[2]: 0000000000000000000000000000000000000000000000000000000000000040
// -    data[3]: 00000000000000000000000000000000000000000000000000000000000000a0
// -    data[4]: 0000000000000000000000000000000000000000000000000000000000000002
// -    data[5]: 000000000000000000000000000000000000000000000000000000000000002a
// -    data[6]: 000000000000000000000000000000000000000000000000000000000000002b
// -    data[7]: 0000000000000000000000000000000000000000000000000000000000000002
// -    data[8]: 000000000000000000000000000000000000000000000000000000000000002c
// -    data[9]: 000000000000000000000000000000000000000000000000000000000000002d
