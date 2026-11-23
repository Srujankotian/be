exp:8
Aim: To create EduToken (EDU), deploy it on the Ethereum Sepolia test network, and transfer tokens between two accounts.

Procedure:
1. Open Remix IDE at remix.ethereum.org.
2. Create a new Solidity file named SimpleToken.sol.
3. Write the Solidity program to create EduToken.
4. Set the token name as EduToken and symbol as EDU.
5. Select Solidity compiler version 0.8.24 and compile the program.
6. Open MetaMask and select the Sepolia test network.
7. Connect MetaMask to Remix using Injected Provider.
8. Enter initial supply as 1000 and deploy the smart contract.
9. Use the transfer function to send 1 EDU to another account.
10. Check the sender and receiver balances to verify the token transfer.
Result: EduToken was created and deployed on the Sepolia network, and token transfer between accounts was demonstrated after transaction confirmation.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SimpleToken {
    string public name = "EduToken";
    string public symbol = "EDU";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor(uint256 initialSupply) {
        totalSupply = initialSupply * 10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address to, uint256 value) public returns (bool) {
        require(to != address(0), "Invalid recipient");
        require(balanceOf[msg.sender] >= value, "Not enough tokens");

        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;

        emit Transfer(msg.sender, to, value);
        return true;
    }
}



Experiment 9: MetaMask Setup and Sepolia Wallet
Aim: To install MetaMask, create a wallet, enable Sepolia test network, receive test ETH, and verify a transaction.
Procedure (10 Points)
1. Open the browser and visit https://metamask.io.
2. Download and install the MetaMask browser extension.
3. Open MetaMask and create a new wallet using a strong password.
4. Save the Secret Recovery Phrase safely and confirm it. Never share it.
5. Open MetaMask settings and enable Show test networks.
6. Select the Sepolia test network from the network list.
7. Copy the wallet's public address.
8. Open the Google Cloud Sepolia Faucet and paste your wallet address to request test ETH.
9. Check the Sepolia ETH balance in MetaMask and verify the transaction using Sepolia Etherscan.
10. Optionally send a small amount of Sepolia ETH to another wallet and verify the transaction status and recipient balance.
Result
MetaMask wallet was configured with the Sepolia test network. Test ETH was requested, and wallet transactions were verified using Sepolia Etherscan.


Experiment 12: Set Up Hyperledger Fabric Network with 2 Organizations and 1 Peer Each
Aim: To set up a Hyperledger Fabric network with two organizations and one peer each, deploy chaincode, and verify transactions.
Procedure (10 Steps with Commands)
Step 1: Open the Fabric test network directory.
cd ~/fabric-samples/test-network
This opens the Fabric test network folder.
Step 2: Start the network and create a channel.
./network.sh up createChannel -c mychannel -ca
This starts two organizations, one peer for each organization, and creates the channel mychannel.
Step 3: Verify the running containers.
docker ps
This checks whether both peer nodes and the orderer are running.
Step 4: Deploy the smart contract (chaincode).
./network.sh deployCC -ccn basic -ccp ../asset-transfer-basic/chaincode-go -ccl go
This deploys the Go-based basic chaincode on the channel.
Step 5: Load the peer environment variables.
source scripts/envVar.sh
this loads the Fabric environment settings.
Step 6: Select Organization 1.
setGlobals 1
This selects the peer of Organization 1.
step 7: Create an asset using chaincode.
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "$ORDERER_CA" -C mychannel -n basic --peerAddresses localhost:7051 --tlsRootCertFiles "$PEER0_ORG1_CA" --peerAddresses localhost:9051 --tlsRootCertFiles "$PEER0_ORG2_CA" -c '{"Args":["CreateAsset","asset12","blue","10","Tom","1000"]}'
This creates an asset with ID asset12, colour blue, size 10, owner Tom, and value 1000.
Step 8: Query the created asset.
peer chaincode query -C mychannel -n basic -c '{"Args":["ReadAsset","asset12"]}'
This reads the asset details from the blockchain ledger.
Step 9: Verify the output.
Expected output:
{
  "ID": "asset12",
  "Color": "blue",
  "Size": 10,
  "Owner": "Tom",
  "AppraisedValue": 1000
}
this confirms that the asset was successfully created and retrieved.
Step 10: Verify the network and transaction results.
Check the Docker containers using:
docker ps
Confirm that both peer nodes and the orderer are running and the asset query returns the expected details.
Result
A Hyperledger Fabric network with two organizations and one peer each was established. The basic chaincode was deployed on mychannel, and an asset was successfully created and queried.



Experiment 11: MetaMask Accounts and Ether Transfer on a Test Network
Aim: To create multiple Ethereum accounts in MetaMask, receive test ETH, transfer ETH between accounts, and verify transactions.
Procedure (10 Points)
1. Install the MetaMask extension from metamask.io.
2. Create a new wallet and set a strong password.
3. Securely save and confirm the 12-word Secret Recovery Phrase.
4. Open MetaMask and select Add new account to create Account 1 and Account 2.
5. Copy the public wallet addresses of both accounts.
6. Enable test networks and select the Sepolia network.
7. Copy Account 1's address and request free test ETH from a Sepolia faucet.
8. Select Account 1, click Send, enter Account 2's address and transfer 0.5 ETH.
9. Confirm the transaction in MetaMask and wait for blockchain confirmation.
10. Open Sepolia Etherscan and verify the transaction hash, nonce, gas used, transaction status, and account balances.
Expected Output
- Account 1 balance decreases after sending ETH.
- Account 2 balance increases after receiving ETH.
- Transaction status: Success.
- Standard ETH transfer gas used: 21,000 units.
Result
Multiple MetaMask accounts were created, test ETH was received, and Ether transfer between accounts was demonstrated and verified using Sepolia Etherscan.



Experiment No. 7: Smart Contract to Transfer Ether from Contract to Other Accounts
Aim: To write, compile, and deploy a Solidity smart contract in Remix IDE to deposit and transfer Ether to other accounts.
Procedure (10 Points)
1. Open Remix IDE: https://remix.ethereum.org.
2. Create a new Solidity file named BalanceTransferContract.sol.
3. Write the Solidity smart contract code to deposit and transfer Ether.
4. Select compiler version 0.8.20 or higher and click Compile.
5. Open Deploy & Run Transactions and select Remix VM (Cancun).
6. Click Deploy to deploy the contract. The deploying account becomes the owner.
7. Enter 5 Ether in the Value field, select Ether, and click deposit() to deposit 5 ETH.
8. Click getContractBalance() to check the contract balance. It should show 5000000000000000000 Wei.
9. Use transferBalance() to transfer 2 ETH to another account. Enter the recipient address and amount 2000000000000000000 Wei.
10. Verify the transaction status and check the contract and recipient balances. Try transferring using another account to verify owner access control.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BalanceTransferContract {
    address public owner;

    event Deposited(address indexed sender, uint256 amount);
    event Transferred(address indexed recipient, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Error: Caller is not the contract owner");
        _;
     }

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        emit Deposited(msg.sender, msg.value);
    }

    function deposit() external payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        emit Deposited(msg.sender, msg.value);
    }

    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function transferBalance(address payable _to, uint256 _amount) external onlyOwner {
        require(_to != address(0), "Error: Invalid recipient address");
        require(address(this).balance >= _amount, "Error: Insufficient balance in contract");


        emit Transferred(_to, _amount);

        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Error: Transfer failed");
    }
    function transferAll(address payable _to) external onlyOwner {
        require(_to != address(0), "Error: Invalid recipient address");
        uint256 total = address(this).balance;
        require(total > 0, "Error: Contract balance is zero");
        emit Transferred(_to, total);
        (bool success, ) = _to.call{value: total}("");
        require(success, "Error: Transfer failed");
    }
}
