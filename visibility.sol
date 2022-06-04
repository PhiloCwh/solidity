pragma solidity ^0.8.0;
/*
调用是针对于我们写合约时调用，而不是部署后的调用
对于内部函数调用
状态变量：a，b，c，d
合约外部：external只能外部合约调用，或用this.external；
继承：
private和external不可继承。其它可以
*/

contract visibilityTest{
    int public a = 0;
    int private b = 1;
    int internal c = 2;
    int public data = 3;

    function privateF()private view returns(int){

    }
    function publicF()public view returns(int){
        return b+c+a+data;
        
    }
    function externalF()external view returns(int){
        return b;
    }
    function internalF()internal view returns(int){
        return b;
    }
    function test()external view{
        privateF();
        internalF();
        this.externalF();

    }

}

contract visibilitySon is visibilityTest{
    function test1()public view returns(int){
        int f;
        f = a+c;//no b the son contract can no view the private variable but inernal
        //privateF();
        publicF();
        return this.externalF();
        internalF();
    }

}
