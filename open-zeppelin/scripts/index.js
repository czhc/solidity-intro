//programmatically interact/test contracts. Add logic into main()
// then run npx hardhat run --network localhost ./scripts/index.js
// make sure local blockchain is running: npx hardhat node

async function main(){
//  const accounts = await ethers.provider.listAccounts();
//  console.log(accounts);
  const address = '0x5FC8d32690cc91D4c39d9d3abcBD16989F875707';
  const Box = await ethers.getContractFactory('Box');
  const box = await Box.attach(address);

  const value = await box.getValue();
  console.log('Box value is: ', value.toString());
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  })