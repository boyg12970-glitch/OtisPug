const hre = require("hardhat");
const fs = require("fs");

async function main() {
  console.log("🚀 Deploying OtisPug NFT Contract...");

  // Get deployer account
  const [deployer] = await hre.ethers.getSigners();
  console.log("📝 Deploying contract from:", deployer.address);

  // Deploy contract
  const OtisPug = await hre.ethers.getContractFactory("OtisPug");
  const contract = await OtisPug.deploy();
  await contract.waitForDeployment();

  const contractAddress = await contract.getAddress();
  console.log("✅ OtisPug contract deployed at:", contractAddress);

  // Load metadata
  const metadata = JSON.parse(fs.readFileSync("./metadata/otis.json", "utf-8"));
  const metadataURI = "ipfs://QmYourMetadataHashHere"; // Replace with actual IPFS hash

  // Mint Otis NFT to deployer
  console.log("\n🎨 Minting Otis NFT to:", deployer.address);
  const tx = await contract.mintOtisPug(deployer.address, metadataURI);
  await tx.wait();

  console.log("✅ Otis NFT minted successfully!");
  console.log("📊 Token ID: 0");
  console.log("🔗 Metadata URI:", metadataURI);

  // Save deployment info
  const deploymentInfo = {
    contractAddress: contractAddress,
    deployerAddress: deployer.address,
    tokenId: 0,
    metadataURI: metadataURI,
    deploymentDate: new Date().toISOString(),
    network: hre.network.name,
  };

  fs.writeFileSync(
    "./deployment.json",
    JSON.stringify(deploymentInfo, null, 2)
  );

  console.log("\n💾 Deployment info saved to deployment.json");
  console.log("\n🎉 Deployment complete!");

  return contractAddress;
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });