/**
 * @type import('hardhat/config').HardhatUserConfig
 */

require('@nomiclabs/hardhat-ethers');
require('@nomiclabs/hardhat-waffle');
require('@nomiclabs/hardhat-etherscan');

const { infuraProjectId, privateKey } = require('./secrets.json');

module.exports = {
  solidity: "0.8.4",
  networks: {
    rinkeby: {
      url: `https://rinkeby.infura.io/v3/${infuraProjectId}`,
      accounts: [ privateKey ]
    }
  },
  etherscan: {
    apiKey: `${process.env.ETHERSCAN_API_TOKEN}`
  }
};
