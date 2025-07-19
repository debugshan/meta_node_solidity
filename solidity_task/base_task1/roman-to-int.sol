// SPDX-License-Identifier: MIT
pragma solidity ~0.8.6;

/*
✅  用 solidity 实现整数转罗马数字
题目描述在 https://leetcode.cn/problems/integer-to-roman/description/
*/

contract int_to_roman {

    struct ValueSymbol {
        uint256 value;
        string symbol;
    }

    ValueSymbol[] ValueSymbols;

    constructor() {
        ValueSymbols = [
            ValueSymbol(1000,"M"),
            ValueSymbol(900, "CM"),
            ValueSymbol(500, "D"),
            ValueSymbol(400, "CD"),
            ValueSymbol(100, "C"),
            ValueSymbol(90, "XC"),
            ValueSymbol(50, "L"),
            ValueSymbol(40, "XL"),
            ValueSymbol(10, "X"),
            ValueSymbol(9, "IX"),
            ValueSymbol(5, "V"),
            ValueSymbol(4, "IV"),
            ValueSymbol(1, "I") 
        ];
    }

    function intToRom (uint256 num) public view  returns (string memory rom){
        // string memory roman;
        // bytes memory roman;
        uint256 len = ValueSymbols.length;

        for (uint256 i = 0; i < len-1; i++) {

            uint256 x = ValueSymbols[i].value;
            // if (x > num) {
            //     continue;    
            // }

            while(num >= x){
                string memory y = ValueSymbols[i].symbol;
                //bytes memory y1 = bytes(y);
                // roman = roman + y1;
                 //roman = append(roman, y.length, y );

                rom = strConcat(rom, y);
                 num -= x;         
                 if (!(num == 0)){
                     break;  
                 } 
            }             
        }
        
        return rom;

    }

    function strConcat(string memory _a, string memory _b) internal returns (string memory ret){
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
        string memory ret = new string(_ba.length + _bb.length);
        bytes memory bret = bytes(ret);
        uint k = 0;
        for (uint i = 0; i < _ba.length; i++){
            bret[k++] = _ba[i];
        }
        for (uint i = 0; i < _bb.length; i++) {
            bret[k++] = _bb[i];
        }
        return string(ret);
   }  

//     func intToRoman(num int) string {
//     roman := []byte{}
//     for _, vs := range valueSymbols {
//         for num >= vs.value {
//             num -= vs.value
//             roman = append(roman, vs.symbol...)
//         }
//         if num == 0 {
//             break
//         }
//     }
//     return string(roman)
// }



}

/*

✅  用 solidity 实现罗马数字转数整数
题目描述在 https://leetcode.cn/problems/roman-to-integer/description/3.

*/

contract roman_to_integer{
    mapping (bytes1 val  => uint256 num) private roman_map;

    constructor(){
        roman_map[ "I"] = 1;
        roman_map[ "V"] = 5;
        roman_map[ "X"] = 10;
        roman_map[ "L"] = 50;
        roman_map[ "C"] = 100;
        roman_map[ "D"] = 500;
        roman_map[ "M"] = 1000;
        
    }

    function Set_roman_map() public {
            roman_map["I"] = 1;
            roman_map["V"] = 5;
            roman_map["X"] = 10;
            roman_map["L"] = 50;
            roman_map["C"] = 100;
            roman_map["D"] = 500;
            roman_map["M"] = 1000;
    }

   function romanToInt (string memory rom) public view returns (uint256){ 
        uint256 ans = 0;
        bytes memory rom_byte = bytes(rom);
        uint256 len = rom_byte.length;
        for (uint256 i = 1; i <= len-1; i++) {
            uint256 x = roman_map[rom_byte[i - 1]];
            uint256 y = roman_map[rom_byte[i]];

            if (x < y) {
                ans -= x;
            } else {
                ans += x;
            }

        }
        return ans + roman_map[rom_byte[len - 1]];
   }


}