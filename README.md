# solidity-homework-week-1



1. #### The contract from Lesson 4 was deployed on Sepolia:
   https://sepolia.etherscan.io/address/0xd1E5187cADfc567Bd684DAf3634E5D7eeFC2fb2E

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld {
    string private text;
    address public owner;

    constructor() {
        text = "Hello World";
        owner = msg.sender;
    }

    function helloWorld() public view returns (string memory) {
        return text;
    }

    function setText(string calldata newText) public onlyOwner {
        text = newText;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    modifier onlyOwner()
    {
        require (msg.sender == owner, "Caller is not the owner");
        _;
    }
}

2. #### Afterwards the text was changed by me (owner) using the setText function
   https://sepolia.etherscan.io/tx/0xcd8aa13046e8e9b7abfe9820e6732a8c7f17d38b1f101f7066decda758154303

3. #### Then the ownership was transferred to 0x61dDeC39741d946Bb895C486826d294CcEd12171 (Group member adi98719199) using the transferOwnership function. https://sepolia.etherscan.io/tx/0xf94e611f0a6e0be8e08977d341f509dc905460fcbb5cec1b5bfb5157353a146d

4. #### Group member rayman1104 also deployed a contract, set a new text and transferred ownership to me: 
   https://sepolia.etherscan.io/address/0xf1219ff3a8b56a3efc292be1214c76167b19943e

5. #### To interact with the HelloWorld contract from a different contract, I created an interface that defines the functions I want to interact with. Then, I can use this interface in the new contract to call those functions on the HelloWorld contract.
  
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

interface IHelloWorld {
    function helloWorld() external view returns (string memory);
    function setText(string calldata newText) external;
    function transferOwnership(address newOwner) external;
}


6. #### Now, in my new contract, I can use the IHelloWorld interface to interact with the functions of the HelloWorld contract:
https://sepolia.etherscan.io/address/0xef7c7e822a124c95095c059ab75657af3f48295d
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./IHelloWorld.sol";

contract OtherContract {
    IHelloWorld public helloWorldContract;
    address public helloWorldAddress; // Address of the deployed HelloWorld contract

    constructor() {
        helloWorldAddress = 0xF1219Ff3a8B56a3Efc292Be1214C76167B19943E;
        helloWorldContract = IHelloWorld(helloWorldAddress);
    }

    function callHelloWorld() public view returns (string memory) {
        return helloWorldContract.helloWorld();
    }

    function setGreeting(string memory newText) public {
        helloWorldContract.setText(newText);
    }

    function transferHelloWorldOwnership(address newOwner) public {
        helloWorldContract.transferOwnership(newOwner);
    }
}

7. When I used the callHelloWorld function, I noticed that rayman1104 had modified the text to read "¡Hola mundo!" instead.
Next, I attempted to transfer ownership of a new text that was passed to me by rayman1104. However, I encountered an error message stating, "reverted: Caller is not the owner". The error ID number was 2637265682204748.
9. #### I believe there may have been an error either when transferring ownership or within the code itself that I am unable to identify. It's possible that my address was mistyped during the process.
