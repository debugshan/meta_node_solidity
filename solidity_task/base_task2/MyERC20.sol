// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

//import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// ✅ 作业 1：ERC20 代币
// 任务：参考 openzeppelin-contracts/contracts/token/ERC20/IERC20.sol实现一个简单的 ERC20 代币合约。要求：
// 合约包含以下标准 ERC20 功能：
// balanceOf：查询账户余额。
// transfer：转账。
// approve 和 transferFrom：授权和代扣转账。
// 使用 event 记录转账和授权操作。
// 提供 mint 函数，允许合约所有者增发代币。
// 提示：
// 使用 mapping 存储账户余额和授权信息。
// 使用 event 定义 Transfer 和 Approval 事件。
// 部署到sepolia 测试网，导入到自己的钱包

interface IERC20 {

    //事件定义
    //当 `value` 代币从一个账户 (`from`) 转移到另一个账户 (`to`) 时触发。
    event Transfer (address indexed from, address indexed to, uint256 value);
    //当通过调用 {approve} 设置 `spender` 为 `owner` 分配的限额时，`value` 即为新的限额。
    event Approval (address indexed owner, address indexed spender, uint256 value);

    //查询
    //function totalSupply() external view returns (uint256);
    //返回“帐户”拥有的代币的价值。
    function balanceOf(address account) external view returns (uint256);
    //返回 `spender` 可以通过 {transferFrom} 代表 `owner` 使用的剩余代币数量。默认值为 0。调用 {approve} 或 {transferFrom} 时，此值会发生变化。
    function allowance(address owner, address spender) external view returns (uint256);

    //交易
    //将 `value` 数量的代币从调用者的账户转移到 `to`。返回一个布尔值，指示操作是否成功。触发 {Transfer} 事件。
    function transfer(address to, uint256 value) external returns (bool);
    //使用 allowance 机制将 `value` 数量的代币从 `from` 移动到 `to`。`value` 将从调用者的 allowance 中扣除。返回一个布尔值，指示操作是否成功。触发 {Transfer} 事件。
    function transferFrom(address from, address to, uint256 value) external returns (bool);


    //授权
    //将 `value` 数量的代币设置为 `spender` 相对于调用者代币的限额。返回一个布尔值，指示操作是否成功。
    //重要提示：请注意，使用此方法更改限额会带来风险，有人可能会因为交易排序不当而同时使用新旧限额。缓解此竞争的一种可能解决方案是，首先将消费者的限额减少到 0，然后再设置
    function approve(address spender, uint256 amount) external returns (bool);

}

contract MyERC20 is IERC20 {

    address public immutable owner;

    uint256 public totalSupply; // 总价总量

    // 存储账户余额
    mapping (address account => uint256) private _balances;
    //授权信息
    mapping (address account => mapping (address spender => uint256)) private _allowances;

    // 函数修改器
    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    //构造函数
    constructor(uint256 _totalSupply){
        totalSupply = _totalSupply;
        _balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);

    }

    //查询账户余额
    function balanceOf(address account) public view virtual returns(uint256){ 
        return _balances[account];
    }
    function allowance(address own, address spender) public view virtual returns(uint256){
        return _allowances[own][spender];
    }

    //交易 转账
    function transfer(address _to, uint256 value) public virtual returns (bool){
        require(value > 0, "value must be greater than 0");
        require(_balances[msg.sender] >= value, "insufficient balance"); 

        _balances[msg.sender] -= value; //扣钱
        _balances[_to] += value;       //加钱
        emit Transfer(msg.sender, _to, value);
        
        return true;
    }
    //transferFrom：代扣转账
    function transferFrom(address from, address to, uint256 value) public virtual returns (bool){
        require(value > 0, "value must be greater than 0");
        require(_balances[msg.sender] >= value, "insufficient balance");
        
        // msg.sender 也就是当前调用者，是被批准者
        _allowances[from][msg.sender] -= value;
        _balances[from] -= value; //扣钱
        _balances[to] += value;       //加钱
        emit Transfer(from, to, value);
        return true;
    }

    //approve 授权
    function approve(address spender, uint256 amount) public virtual returns (bool) {
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    // mint 函数，允许合约所有者增发代币
    function mint(uint256 value) external onlyOwner returns (bool){
        totalSupply += value;
        _balances[msg.sender] += value;
        emit Transfer(msg.sender, address(0), value);

        return true;
    }
    
}
