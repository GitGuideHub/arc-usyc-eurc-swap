// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract Swap {
    address public owner;
    IERC20 public USYC;
    IERC20 public EURC;

    uint256 public rateUSYCtoEURC = 1e18; 
    uint256 public rateEURCtoUSYC = 1e18;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor(address _usyc, address _eurc) {
        owner = msg.sender;
        USYC = IERC20(_usyc);
        EURC = IERC20(_eurc);
    }

    function swapUSYCtoEURC(uint256 amount) external {
        require(USYC.transferFrom(msg.sender, address(this), amount), "USYC transfer failed");
        require(EURC.transfer(msg.sender, amount), "EURC transfer failed");
    }

    function swapEURCtoUSYC(uint256 amount) external {
        require(EURC.transferFrom(msg.sender, address(this), amount), "EURC transfer failed");
        require(USYC.transfer(msg.sender, amount), "USYC transfer failed");
    }

    function fund(address token, uint256 amount) external onlyOwner {
        require(IERC20(token).transferFrom(msg.sender, address(this), amount), "Funding failed");
    }

    function withdraw(address token, uint256 amount) external onlyOwner {
        require(IERC20(token).transfer(msg.sender, amount), "Withdraw failed");
    }
}
