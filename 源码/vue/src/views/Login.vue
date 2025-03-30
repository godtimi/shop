<template>
    <div class="wrapper">
        <div class="main">
            <div class="login-box">
                <div class="login-title">登 录</div>
                <el-form :model="user" :rules="rules" ref="userForm">
                    <el-form-item prop="username">
                        <el-input size="medium" class="login-input" prefix-icon="el-icon-user"
                                  v-model="user.username" placeholder="用户名"></el-input>
                    </el-form-item>
                    <el-form-item prop="password">
                        <el-input size="medium" class="login-input" prefix-icon="el-icon-lock" show-password
                                  v-model="user.password" placeholder="密码"></el-input>
                    </el-form-item>
                    <el-form-item class="login-actions">
                        <el-button type="primary" size="medium" class="login-button" autocomplete="off" @click="login">登录</el-button>
                        <el-button type="warning" size="medium" class="register-button" autocomplete="off" @click="$router.push('/register')">注册</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </div>
    </div>
</template>

<script>
import {setRoutes} from "@/router";
import myBMap from '../bmp'

export default {
    name: "Login",
    data() {
        return {
            user: {},
            rules: {
                username: [
                    {required: true, message: '请输入用户名', trigger: 'blur'},
                    {min: 3, max: 10, message: '长度在 3 到 10 个字符', trigger: 'blur'}
                ],
                password: [
                    {required: true, message: '请输入密码', trigger: 'blur'},
                    {min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur'}
                ],
            }
        }
    },
    methods: {
        getCity() {
            myBMap.init().then(BMap => {
                const geolocation = new BMap.Geolocation()
                geolocation.getCurrentPosition((position) => {
                    let city = position.address.city;             //获取城市信息
                    let province = position.address.province;     //获取省份信息
                    localStorage.setItem("location", city)
                }, (e) => {
                    console.log(e)
                    console.log('定位失败')
                }, {provider: 'baidu'})
            })
        },
        login() {
            this.$refs['userForm'].validate((valid) => {
                if (valid) {  // 表单校验合法
                    this.request.post("/user/login", this.user).then(res => {
                        if (res.code === '200') {
                            localStorage.setItem("user", JSON.stringify(res.data)) //存储用户信息到浏览器
                            localStorage.setItem("menus", JSON.stringify(res.data.menus)) //存储菜单信息到浏览器
                            setRoutes() //动态设置当前路由
                            if (res.data.role === 'ROLE_ADMIN') {
                                this.$router.push("/home")
                            } else {
                                this.$router.push("/reception/home")
                            }
                            this.$message.success("登录成功")
                        } else {
                            this.$message.error(res.msg)
                        }
                    })
                }
            });
        }
    },
    mounted() {
        this.getCity() //调用函数获取城市信息
    },
    created() {
        let that = this
        document.onkeydown = function (e) {
            e = window.event || e
            if (that.$route.path === '/login' && (e.code === 'Enter' || e.code === 'enter')) {
                that.login()
            }
        }
    },
}
</script>

<style>
.wrapper {
    height: 100vh;
    background-image: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    overflow: hidden;
}

.main {
    background: url("../assets/login.jpg") no-repeat center center;
    height: 100vh;
    width: 100%;
    background-size: cover;
    display: flex;
    justify-content: center;
    align-items: center;
}

.login-box {
    background-color: rgba(255, 255, 255, 0.9);
    width: 420px;
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
    animation: fadeIn 0.8s ease-in-out;
}

.login-title {
    margin: 0 0 30px 0;
    text-align: center;
    font-size: 28px;
    font-weight: bold;
    background: linear-gradient(to right, #4facfe, #00f2fe);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

.login-input {
    margin: 20px 0;
}

.login-input >>> .el-input__inner {
    height: 50px;
    border-radius: 6px;
    border: 1px solid #dcdfe6;
    transition: all 0.3s;
}

.login-input >>> .el-input__inner:focus {
    border-color: #409EFF;
    box-shadow: 0 0 0 2px rgba(64, 158, 255, 0.2);
}

.login-actions {
    margin: 30px 0 10px 0;
    text-align: center;
}

.login-button {
    width: 120px;
    height: 48px;
    border-radius: 6px;
    background-image: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
    border: none;
    font-size: 16px;
    font-weight: 500;
    transition: all 0.3s;
    margin-right: 15px;
}

.login-button:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0, 242, 254, 0.3);
}

.register-button {
    width: 120px;
    height: 48px;
    border-radius: 6px;
    background-image: linear-gradient(to right, #f78ca0 0%, #f9748f 100%);
    border: none;
    font-size: 16px;
    font-weight: 500;
    transition: all 0.3s;
}

.register-button:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(249, 116, 143, 0.3);
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
</style>
