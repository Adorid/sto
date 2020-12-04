const StorjRegistry = artifacts.require('./StorjRegistry.sol')

module.exports = async function(deployer) {
  const registry = await StorjRegistry.deployed()

  console.log('Account address:', registry.address)

  let accounts = await web3.eth.getAccounts()
  await registry.createStorj('Carl', 'https://thegraph.com/img/team/team_04.png', {
    from: accounts[0],
  })
  await registry.createStorj('Lucas', 'https://thegraph.com/img/team/bw_Lucas.jpg', {
    from: accounts[1],
  })
}
