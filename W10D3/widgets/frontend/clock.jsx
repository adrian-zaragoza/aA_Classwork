import React from "react"

class Clock extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      time: new Date()
    }
  }
  tick(){
    this.setState({ time: new Date()})
  }

  render(){
    return(
    <div>
      <h1>Clock</h1>
    </div>
    )
  }
}

export default Clock;