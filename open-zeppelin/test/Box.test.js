//test files should mirror contracts/ repo

const { expect }  = require('chai');

// add test helpers
// to use test helpers from waffle, install:
// these: @nomiclabs/hardhat-waffle ethereum-waffle

describe('Box', function(){

  before(async function(){
    this.Box = await ethers.getContractFactory('Box');
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
})