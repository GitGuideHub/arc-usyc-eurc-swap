# Deployment Guide (Remix + MetaMask)

## 1. Open Remix
https://remix.ethereum.org

## 2. Create a new file
Name: `Swap.sol`  
Paste the contract code from this repository.

## 3. Select compiler
- Compiler: **0.8.20**
- Enable optimization: ON

Click **Compile Swap.sol**

## 4. Connect to ARC Testnet
In MetaMask add the network:

**Network Name:** ARC Testnet  
**RPC URL:** https://rpc.test.arc.network  
**Chain ID:** 20240101  
**Currency Symbol:** ARC  

Switch network.

## 5. Deploy
In Remix → Deploy & Run:

- Environment: **Injected Provider – MetaMask**
- Constructor arguments:
  - `_usyc`: *your USYC token address*
  - `_eurc`: `0x89B50855Aa3bE2F677cD6303Cec089B5F319D72a`

Click **Deploy**

---

# 6. FUND the Contract (important!)
### Simple method
Use Remix:

- Select **fund**
- token = USYC or EURC address  
- amount = number (example: 100e18)
- Before clicking → in MetaMask approve token for Remix
- Click fund

### Hard method
Use contract UI of token directly:

Call:

1. `approve(spender = your Swap contract, amount)`
2. Then call Swap contract → `fund(token, amount)`

---

# 7. Use Swap
Available buttons after deploy:

- **swapUSYCtoEURC(amount)**
- **swapEURCtoUSYC(amount)**
- **fund(token, amount)**
- **withdraw(token, amount)**

