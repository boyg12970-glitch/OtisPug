# 🐕 OtisPug NFT

A unique ERC-721 NFT smart contract for **Otis the Legendary Pug**.

## 📋 Project Overview

OtisPug is a one-of-a-kind NFT representing the legendary Pug named Otis. This project includes:

- ✅ **Smart Contract** - ERC-721 compliant NFT contract
- ✅ **NFT Metadata** - Complete trait definitions for Otis
- ✅ **Deployment Scripts** - Ready-to-use deployment automation
- ✅ **Hardhat Configuration** - Multi-network support

## 🚀 Quick Start

### Prerequisites

- Node.js (v16 or higher)
- npm or yarn
- Git

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
   - `PRIVATE_KEY` - Your wallet's private key (⚠️ Keep this secret!)
   - `ETHERSCAN_API_KEY` - For contract verification

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

### Deploy to Mainnet

```bash
npm run deploy:mainnet
```

⚠️ **WARNING**: Deploying to mainnet costs real ETH. Make sure you have enough ETH in your wallet.

## 💼 Adding to Your Wallet

After deployment:

1. Get the contract address from `deployment.json`
2. Open your wallet (MetaMask, Phantom, etc.)
3. Select "Import tokens" or "Add custom network"
4. Enter the contract address
5. Otis will appear in your wallet!

## 📝 Verify Contract on Etherscan

```bash
npx hardhat verify --network sepolia <CONTRACT_ADDRESS>
```

## 🔗 Upload Metadata to IPFS

Before deploying, upload your metadata and image to IPFS:

1. Use [Pinata](https://www.pinata.cloud/) or [NFT.storage](https://nft.storage/)
2. Upload `metadata/otis.json` and your Otis image
3. Get the IPFS hash
4. Update `scripts/deploy.js` with the actual IPFS hash

## 🔒 Security

- **Never commit `.env`** - The `.gitignore` excludes it by default
- **Never share your private key** - Keep it secure
- **Test on testnet first** - Always deploy to Sepolia before mainnet

## 📚 Resources

- [OpenZeppelin ERC-721](https://docs.openzeppelin.com/contracts/4.x/erc721)
- [Hardhat Documentation](https://hardhat.org/docs)
- [Ethereum Development](https://ethereum.org/en/developers/)
- [IPFS Documentation](https://docs.ipfs.tech/)

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
