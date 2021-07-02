//programmatically interact/test contracts. Add logic into main()
// then run npx hardhat run --network localhost ./scripts/index.js
// make sure local blockchain is running: npx hardhat node

async function main(){
//  const accounts = await ethers.provider.listAccounts();
//  console.log(accounts);
  const address = '0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9';
  const Box = await ethers.getContractFactory('Box');
  const box = await Box.attach(address);

}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  })