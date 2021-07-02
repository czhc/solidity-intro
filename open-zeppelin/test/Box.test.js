//test files should mirror contracts/ repo

const { expect }  = require('chai');
const { MockProvider } = require('ethereum-waffle');

// add test helpers
// to use test helpers from waffle, install:
// these: @nomiclabs/hardhat-waffle ethereum-waffle

describe('Box', function(){

  before(async function(){
    this.Box = await ethers.getContractFactory('Box');
    this.provider = new MockProvider();
  });

  beforeEach(async function(){
    this.box = await this.Box.deploy();
    await this.box.deployed();
  })

  it('retrieve returns a value previously stored', async function(){
    await this.box.setValue(42);
    expect(await this.box.getValue()).to.equal(42);
  })

  it('emits event ValueChanged', async function(){
    await expect(this.box.setValue(42)).to.emit(this.box, 'ValueChanged');
  })

  it('reverts when unauthorized', async function(){
    const [owner, addr1] = await ethers.getSigners();
    await expect(this.box.setValue(100, { from: addr1 })).to.be.reverted;

  })
})