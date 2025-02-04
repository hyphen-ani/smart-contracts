// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract TeslaRegistry{
    struct Tesla{
        string model;
        uint256 year;
        string color;
        uint256 mileage;
        string vin;
    }

    Tesla[] public teslas;

    function addTesla(string memory _model, uint _year, string memory _color, uint _mileage, string memory _vin) public {
        Tesla memory newTesla = Tesla({
            model: _model,
            year: _year,
            color: _color,
            mileage: _mileage,
            vin: _vin
        });

        teslas.push(newTesla);
    }
}