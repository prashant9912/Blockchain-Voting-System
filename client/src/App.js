import React, { Component } from "react";

import Web3 from "web3";

import ElectionContract from "./Election.json";

export default class App extends Component {

  componentDidMount=()=>{
    this.loadBlockchainData()

  }

    state = { account: '',candidates:[] }


  async loadBlockchainData() {
    const web3 = new Web3(Web3.givenProvider || "http://localhost:7545")
    const accounts = await web3.eth.getAccounts()

    
    //contract instants
    const networkId = await web3.eth.net.getId();
    const deployedNetwork = ElectionContract.networks[networkId];
    const instance = new web3.eth.Contract(
      ElectionContract.abi,
      deployedNetwork && deployedNetwork.address,
    );

    const number = await instance.methods.candidatesCount().call();
    console.log(number)
    //

      let candi=[]

    for(let i=1;i<=number;i++){
      await instance.methods.candidates(i).call().then(candidate=>{
        let obb={}
        obb.id=candidate.id
        obb.name=candidate.name
        obb.vote = candidate.voteCount
        candi.push(obb)
      })
    }


  
    this.setState({ account: accounts[0],candidates:candi })


  }


  render() {
    return <div>
              <p>Your account: {this.state.account}</p>

              {this.state.candidates.map((v,k)=><p key={k}>{v.name}</p>)}



    </div>;
  }
}

// App.contextType =  Theme
