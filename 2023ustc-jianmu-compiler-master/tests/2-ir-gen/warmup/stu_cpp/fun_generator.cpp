#include "BasicBlock.hpp"
#include "Constant.hpp"
#include "Function.hpp"
#include "IRBuilder.hpp"
#include "Module.hpp"
#include "Type.hpp"

#include <iostream>
#include <memory>

#define CONST_INT(num) \
    ConstantInt::get(num, module)

int main()
{
    auto module = new Module();
    // 创建一个 IRBuilder 实例（后续创建指令均使用此实例操作）
    auto builder = new IRBuilder(nullptr, module);
    Type *Int32Type = module->get_int32_type();

    // 接下来创建 callee 函数
    // 声明函数参数类型的 vector，此处的 vector 数组含有两个元素，每个均为 Int32Type，表明待创建函数有两个参数，类型均为 Int32Type 实例代表的类型
    std::vector<Type *> Ints(1, Int32Type);
    // 创建函数类型，FunctionType::get 的第一个参数是函数返回值类型，第二个是函数参数类型列表
    auto calleeFunTy = FunctionType::get(Int32Type, Ints);
    // 通过函数类型创建函数 callee，输入参数解释：函数类型，函数名 name，函数所属 module
    auto calleeFun = Function::create(calleeFunTy, "callee", module);

    // 为函数 callee 创建起始 BasicBlock，参数解释：所属 module，名称 name，所属函数
    auto bb = BasicBlock::create(module, "entry", calleeFun);
    // 将辅助类实例化 builder 插入指令的起始位置设置在 bb 对应的 BasicBlock
    builder->set_insert_point(bb);
    // 使用辅助类实例化 builder 创建了一条 alloca 指令，在栈上分配返回值的空间
    auto retAlloca = builder->create_alloca(Int32Type);
    // 使用辅助类实例化 builder 创建了一条 alloca 指令，在栈上分配参数 a 的空间
    auto aAlloca = builder->create_alloca(Int32Type);

    // 获取 callee 函数的形参，通过 Function 中的 iterator
    std::vector<Value *> args;
    for (auto &arg : calleeFun->get_args())
    {
        args.push_back(&arg);
    }
    // 使用辅助类实例化 builder 创建了一条 store 指令，将参数 a store 下来
    builder->create_store(args[0], aAlloca);

    // 使用辅助类实例化 builder 创建了一条 load 指令，将参数 a load 出来
    auto aLoad = builder->create_load(aAlloca);

    // 使用 builder 创建了一条 imul 指令，计算 2*a 的值
    auto mul = builder->create_imul(aLoad, CONST_INT(2));

    // 使用辅助类实例化 builder 创建了一条 ret 指令，返回 2*a
    builder->create_ret(mul);

    auto mainFun = Function::create(FunctionType::get(Int32Type, {}), "main", module);
    bb = BasicBlock::create(module, "entry", mainFun);
    // 将 builder 插入指令的位置调整至 main 函数起始 bb 上
    builder->set_insert_point(bb);
    // 使用辅助类实例化 builder 创建了一条 alloca 指令，在栈上分配返回值的空间
    retAlloca = builder->create_alloca(Int32Type);
    // main 函数默认 ret 0
    builder->create_store(CONST_INT(0), retAlloca);
    // 此处创建 call 指令，调用 callee 函数
    auto call = builder->create_call(calleeFun, {CONST_INT(110)});
    // 使用 builder 创建了一条 ret 指令，将 funArray 返回值 load 出来的结果作为 main 函数的返回值返回
    builder->create_ret(call);
    // 输出 module 中的所有 IR 指令
    std::cout << module->print();
    delete module;
    return 0;
}
