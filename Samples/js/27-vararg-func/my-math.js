function max() {
    let res = arguments[0];
    for (let i = 1; i < arguments.length; i++) {
        if (nums[i] > res) {
            res = nums[i];
        }
    }
    return res;
}

// function min(nums) {
function min(...nums) {
    let res = nums[0];
    for (let i = 1; i < nums.length; i++) {
        if (nums[i] < res) {
            res = nums[i];
        }
    }
    return res;
}
