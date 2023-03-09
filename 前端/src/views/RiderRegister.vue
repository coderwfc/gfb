<template>
    <el-container>
        <el-header height="40px">
            <el-page-header @back="goBack" content="用户注册"></el-page-header>
        </el-header>
        <el-main>
            <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
                <el-form-item label="用户名" prop="username">
                    <el-input type="text" v-model="ruleForm.username" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="密码" prop="number">
                    <el-input type="password" v-model="ruleForm.number" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="确认密码" prop="checkNumber">
                    <el-input type="password" v-model="ruleForm.checkNumber" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="姓名" prop="name">
                    <el-input type="text" v-model="ruleForm.name" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="手机号" prop="phone">
                    <el-input type="text" v-model="ruleForm.phone" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="年龄" prop="age">
                    <el-input type="number" v-model.number="ruleForm.age"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="submitForm(ruleForm)">注册</el-button>
                    <el-button @click="resetForm('ruleForm')">重置</el-button>
                </el-form-item>
            </el-form>
        </el-main>
        <el-footer></el-footer>
    </el-container>

</template>
<style>
    .el-form{
        width: 500px;
        height: 200px;
        margin: 20px auto;
    }

    .el-container{
        height: 680px;
    }
    .el-main {
        background-color: #E9EEF3;
        color: #333;
        text-align: center;
        line-height: 160px;

    }

    .el-header {
        background-color: #409EFF;
        color: #333;
        text-align: center;
    }

    .el-footer{
        background-color: #B3C0D1;
        color: #333;
    }
</style>
<script>
    export default {
        name: "RiderRegister",
        data() {
            const validateUsername = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入用户名'));
                } else {
                    callback();
                }
            };


            const validatePass = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入密码'));
                } else {
                    if (this.ruleForm.checkNumber !== '') {
                        this.$refs.ruleForm.validateField('checkNumber');
                    }
                    callback();
                }
            };

            const validatePass2 = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请再次输入密码'));
                } else if (value !== this.ruleForm.number) {
                    callback(new Error('两次输入密码不一致!'));
                } else {
                    callback();
                }
            };

            const validateName = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入姓名'));
                } else {
                    callback();
                }
            };

            const validatePhone = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入手机号'));
                } else {
                    setTimeout(()=> {
                        if(value === '123'){
                            callback(new Error('该手机号已注册！！'))
                        }else {
                            callback();
                        }
                    },1000)

                }
            };

            const checkAge = (rule, value, callback) => {
                if (!value) {
                    return callback(new Error('年龄不能为空'));
                }
                setTimeout(() => {
                    if (!Number.isInteger(value)) {
                        callback(new Error('请输入数字值'));
                    } else {
                        if (value < 18) {
                            callback(new Error('必须年满18岁'));
                        } else {
                            callback();
                        }
                    }
                }, 500);
            };

            return {
                ruleForm: {
                    username:'',
                    number: '',
                    checkNumber: '',
                    name:'',
                    phone:'',
                    age: ''
                },
                rules: {
                    username: [
                        { validator:validateUsername,trigger: 'blur'}
                    ],
                    number: [
                        { validator: validatePass, trigger: 'blur' }
                    ],
                    checkNumber: [
                        { validator: validatePass2, trigger: 'blur' }
                    ],
                    name: [
                        { validator:validateName,trigger: 'blur'}
                    ],
                    phone: [
                        { validator:validatePhone,trigger: 'blur'}
                    ],
                    age: [
                        { validator: checkAge, trigger: 'blur' }
                    ]
                }
            };
        },
        methods: {
            // submitForm(formName) {
            //     const that = this;
            //     this.$refs[formName].validate((valid) => {
            //         if (valid) {
            //             if(confirm("确认信息无误吗？")){
            //                 const username = that.ruleForm.username;
            //                 const password = that.ruleForm.pass;
            //                 const name = that.ruleForm.name;
            //                 const phone = that.ruleForm.phone;
            //                 const age = that.ruleForm.age;
            //                 /*console.log(username+","+password+"")*/
            //                 this.$message({
            //                     message: '注册成功！！！',
            //                     type: 'success'
            //                 });
            //                 this.$router.push("/")
            //             }else {
            //                 return false;
            //             }
            //
            //         } else {
            //             console.log('error submit!!');
            //             return false;
            //         }
            //     });
            // },

          submitForm(form) {
            const that = this;
            this.$refs['ruleForm'].validate((valid) => {
              if (valid) {
                console.log(form);
                this.$confirm("确定信息无误吗？",'注册提示',{
                  confirmButtonText: '确定',
                  cancelButtonText: '取消',
                  type:'info'
                }).then(()=> {
                  this.axios.post("http://localhost:8084/deliveryRegister", form)
                      .then(resp => {
                        if (resp.data === "success") {
                          this.$message({
                            message: '注册成功！！！',
                            type: 'success'
                          });
                          this.$router.push("/toRiderLogin")
                        } else {
                          this.$message({
                            message: '注册失败！！！',
                            type: 'error'
                          });
                        }
                      })
                }).catch(()=>{
                  this.$message({
                    message: '取消注册！！！',
                    type: 'info'
                  });
                })
              } else {
                Toast("请输入店铺信息");
                return false;
              }
            });
          },



            resetForm(formName) {
                this.$refs[formName].resetFields();
            },
            goBack() {
                this.$router.push("/registerType")
            }
        }
    }
</script>

<style scoped>

</style>
