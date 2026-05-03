# 🐕 OtisPug NFT

A unique ERC-721 NFT smart contract for **Otis the Legendary Pug**.

## 📋 Project Overview

OtisPug is a one-of-a-kind NFT representing the legendary Pug named Otis. This project includes:

- ✅ **Smart Contract** - ERC-721 compliant NFT contract
- ✅ **NFT Metadata** - Complete trait definitions for Otis
- ✅ **Deployment Scripts** - Ready-to-use deployment automation
- ✅ **Hardhat Configuration** - Multi-network support
- ✅ **Custom Wallet Minting** - Send NFT to any Ethereum address

## 🚀 Quick Start

### Prerequisites

- Node.js (v16 or higher)
- npm or yarn
- Git
- Sepolia ETH for gas fees (get from [Sepolia Faucet](https://sepoliafaucet.com/))

### Installation

1. Clone the repository:
```bash
git clone https://github.com/boyg12970-glitch/OtisPug.git
cd OtisPug
```

2. Install dependencies:
```bash
npm install
```

3. Create `.env` file from `.env.example`:
```bash
cp .env.example .env
```

4. Edit `.env` and add your values:
   - `SEPOLIA_RPC_URL` - Get from [Infura](https://infura.io) or [Alchemy](https://www.alchemy.com/)
   - `PRIVATE_KEY` - Your deployer wallet's private key (⚠️ Keep this secret!)
   - `ETHERSCAN_API_KEY` - For contract verification (optional)

## 📦 Project Structure

```
OtisPug/
├── contracts/
│   └── OtisPug.sol          # ERC-721 Smart Contract
├── scripts/
│   └── deploy.js            # Deployment script
├── metadata/
│   └── otis.json            # NFT metadata & traits
├── hardhat.config.js        # Hardhat configuration
├── package.json             # Dependencies
├── .env.example             # Environment variables template
└── README.md                # This file
```

## 🛠️ Smart Contract

### OtisPug.sol

ERC-721 contract with the following features:

- **Mint OtisPug NFTs** - Owner can mint new NFTs
- **Metadata Storage** - Each NFT has a metadata URI
- **Ownership** - Ownable pattern for access control

### Contract Functions

```solidity
// Mint a new Otis NFT
mintOtisPug(address to, string memory tokenURI) public onlyOwner

// Set base URI for tokens
setBaseURI(string memory newBaseURI) public onlyOwner

// Get current token counter
getTokenCounter() public view returns (uint256)
```

## 📊 NFT Metadata

Otis's attributes are defined in `metadata/otis.json`:

```json
{
  "name": "Otis the Legendary Pug",
  "description": "Otis is a one-of-a-kind legendary Pug NFT...",
  "attributes": [
    { "trait_type": "Species", "value": "Pug" },
    { "trait_type": "Rarity", "value": "Legendary" },
    { "trait_type": "Color", "value": "Fawn" },
    { "trait_type": "Special Ability", "value": "Heart Stealer" }
  ]
}
```

## 🚀 Deployment

### Deploy to Sepolia Testnet

```bash
npm run deploy:sepolia
```

This will:
1. Compile the contract
2. Deploy to Sepolia testnet
3. Automatically mint Otis NFT to your wallet
4. Save deployment info to `deployment.json`

**Output example:**
```
🚀 Deploying OtisPug NFT Contract...
📝 Deploying contract from: 0x1234...
✅ OtisPug contract deployed at: 0xabcd...
🎨 Minting Otis NFT to: 0x1234...
✅ Otis NFT minted successfully!
📊 Token ID: 0
🔗 Metadata URI: ipfs://QmYourMetadataHashHere
📱 Deployment info saved to deployment.json
```

### Deploy to Mainnet

```bash
npm run deploy:mainnet
```

⚠️ **WARNING**: Deploying to mainnet costs real ETH. Make sure you have enough ETH in your wallet.

## 💼 Mint to a Specific Wallet

To mint Otis NFT to a different wallet address:

1. Edit `scripts/deploy.js` and change the mint line from:
```javascript
const tx = await contract.mintOtisPug(deployer.address, metadataURI);
```

To:
```javascript
const walletAddress = "0x2d3b335d58643d38987aeafcd3f3a1bfa51e7a8f"; // Replace with target wallet
const tx = await contract.mintOtisPug(walletAddress, metadataURI);
```

2. Then deploy:
```bash
npm run deploy:sepolia
```

The NFT will be minted directly to that wallet address!

## 📱 Adding to Your Wallet

After deployment:

1. Get the contract address from `deployment.json`
2. Open your wallet (MetaMask, Phantom, etc.)
3. Switch to Sepolia testnet
4. Select "Import tokens" or "Add custom NFT"
5. Enter the contract address and token ID (0)
6. Otis will appear in your wallet! 🎉

**For Sepolia testnet:**
- **Network**: Sepolia Test Network
- **RPC URL**: https://sepolia.infura.io/v3/YOUR_KEY
- **Chain ID**: 11155111
- **Currency**: SepoliaETH

## 📝 Verify Contract on Etherscan

After deployment, verify your contract on [Sepolia Etherscan](https://sepolia.etherscan.io/):

```bash
npx hardhat verify --network sepolia <CONTRACT_ADDRESS>
```

Example:
```bash
npx hardhat verify --network sepolia 0xabcd1234567890abcd1234567890abcd12345678
```

## 🔗 Upload Metadata to IPFS

For permanent metadata storage:

1. Use [Pinata](https://www.pinata.cloud/) or [NFT.storage](https://nft.storage/)
2. Upload `metadata/otis.json` and your Otis image
3. Get the IPFS hash (e.g., `QmYourMetadataHashHere`)
4. Update `scripts/deploy.js`:
```javascript
const metadataURI = "ipfs://QmYourMetadataHashHere"; // Your actual IPFS hash
```

5. Redeploy with updated IPFS URI

## 🔒 Security

- **Never commit `.env`** - The `.gitignore` excludes it by default
- **Never share your private key** - Keep it secure and offline
- **Test on testnet first** - Always deploy to Sepolia before mainnet
- **Use hardware wallets** - For mainnet deployments, use a hardware wallet
- **Double-check addresses** - Verify wallet addresses before minting

## 📚 Resources

- [OpenZeppelin ERC-721](https://docs.openzeppelin.com/contracts/4.x/erc721)
- [Hardhat Documentation](https://hardhat.org/docs)
- [Ethereum Development](https://ethereum.org/en/developers/)
- [IPFS Documentation](https://docs.ipfs.tech/)
- [Sepolia Faucet](https://sepoliafaucet.com/)
- [Sepolia Etherscan](https://sepolia.etherscan.io/)

## 📄 License

MIT License - See LICENSE file for details

## 🐕 About Otis

Otis is a legendary Pug known for:
- ❤️ Stealing hearts
- 😊 Charming personality
- 🎨 Maximum cuteness level
- 🌟 One-of-a-kind status

---

**Happy NFT minting! 🎉**
