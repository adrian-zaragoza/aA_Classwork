Array.prototype.uniq = function() {
  let array = []
  for(let i = 0; i < this.length; i++){

    if (!array.includes(this[i])){

      array.push(this[i]);
    }

  }
  return array;
}

Array.prototype.two_sum = function () {
  let array = []
  for(let i = 0; i < this.length - 1; i++){

    for(let j = 1; j < this.length; j++){

      if (this[j] + this[i] === 0 && j > i){
        let sub_arr = [i, j]
        array.push(sub_arr)
      }
    }
  }
  return array;
}

Array.prototype.transpose = function () {
  let array = []
  for(let i = 0; i < this.length; i++){
    let second_array = []
    for(let j = 0; j < this.length; j++){
      let subarr = this[j][i]
      second_array.push(subarr)
    }
    array.push(second_array)
  }
  return array
}

