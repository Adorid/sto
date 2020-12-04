const StorjRegistry = artifacts.require('./StorjRegistry.sol')

module.exports = async function(deployer) {
  await deployer.deploy(StorjRegistry)
}
