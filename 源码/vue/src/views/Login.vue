<template>
    <div class="wrapper">
        <div class="background-animation"></div>
        <div class="main">
            <div class="login-container">
                <div class="login-box">
                    <div class="login-header">
                        <div class="login-logo">
                            <svg viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg" class="logo-svg">
                                <!-- 羊头 -->
                                <ellipse cx="60" cy="60" rx="45" ry="40" fill="#f0f0f0" />
                                <ellipse cx="60" cy="70" rx="30" ry="25" fill="#f0f0f0" />
                                
                                <!-- 耳朵 -->
                                <ellipse cx="30" cy="40" rx="15" ry="20" transform="rotate(-20, 30, 40)" fill="#f0f0f0" stroke="#67C23A" stroke-width="2" />
                                <ellipse cx="90" cy="40" rx="15" ry="20" transform="rotate(20, 90, 40)" fill="#f0f0f0" stroke="#67C23A" stroke-width="2" />
                                
                                <!-- 眼睛 -->
                                <circle cx="45" cy="60" r="5" fill="#333" />
                                <circle cx="75" cy="60" r="5" fill="#333" />
                                <circle cx="45" cy="58" r="2" fill="#fff" />
                                <circle cx="75" cy="58" r="2" fill="#fff" />
                                
                                <!-- 鼻子和嘴 -->
                                <ellipse cx="60" cy="70" rx="10" ry="7" fill="#f9c6c6" />
                                <path d="M50 75 Q60 85 70 75" fill="none" stroke="#333" stroke-width="2" />
                                
                                <!-- 角 -->
                                <path d="M35 30 Q30 10 40 5" fill="none" stroke="#67C23A" stroke-width="4" stroke-linecap="round" />
                                <path d="M85 30 Q90 10 80 5" fill="none" stroke="#67C23A" stroke-width="4" stroke-linecap="round" />
                            </svg>
                        </div>
                        <div class="login-title">羊羊生鲜</div>
                        <div class="login-subtitle">新鲜食材，健康生活</div>
                    </div>
                    <el-form :model="user" :rules="rules" ref="userForm" class="login-form">
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
    width: 100%;
    position: relative;
    overflow: hidden;
    background: linear-gradient(135deg, #f5f7fa 0%, #e4e8ec 100%);
}

.background-animation {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(135deg, #67C23A 0%, #95D475 100%);
    z-index: 1;
    opacity: 0.8;
}

.background-animation::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: 
        radial-gradient(circle at 15% 50%, rgba(255, 255, 255, 0.2) 0%, transparent 20%),
        radial-gradient(circle at 85% 30%, rgba(255, 255, 255, 0.2) 0%, transparent 20%);
    z-index: 2;
}

.background-animation::after {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: 
        linear-gradient(45deg, transparent 60%, rgba(255, 255, 255, 0.1) 70%, transparent 80%);
    animation: wave 15s infinite linear;
    z-index: 3;
}

@keyframes wave {
    0% {
        background-position: 0% 0%;
    }
    100% {
        background-position: 100% 100%;
    }
}

@keyframes pulse {
    0% {
        opacity: 0.3;
    }
    50% {
        opacity: 0.7;
    }
    100% {
        opacity: 0.3;
    }
}

.main {
    position: relative;
    height: 100vh;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 10;
}

.login-container {
    position: relative;
    perspective: 1000px;
}

.login-box {
    background-color: rgba(255, 255, 255, 0.95);
    width: 420px;
    padding: 40px;
    border-radius: 16px;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2), 0 5px 15px rgba(0, 0, 0, 0.05);
    animation: fadeIn 0.8s ease-in-out, float 6s infinite ease-in-out;
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.2);
    transform-style: preserve-3d;
}

@keyframes float {
    0% {
        transform: translateY(0px);
    }
    50% {
        transform: translateY(-10px);
    }
    100% {
        transform: translateY(0px);
    }
}

.login-header {
    text-align: center;
    margin-bottom: 30px;
}

.login-logo {
    width: 80px;
    height: 80px;
    margin: 0 auto 15px;
}

.logo-svg {
    width: 100%;
    height: 100%;
    filter: drop-shadow(0 2px 5px rgba(0, 0, 0, 0.2));
}

.login-title {
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 5px;
    background: linear-gradient(to right, #67C23A, #95D475);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

.login-subtitle {
    font-size: 14px;
    color: #909399;
    margin-bottom: 20px;
}

.login-form {
    margin-top: 20px;
}

.login-input {
    margin: 20px 0;
}

.login-input >>> .el-input__inner {
    height: 50px;
    border-radius: 10px;
    border: 1px solid rgba(103, 194, 58, 0.2);
    background-color: rgba(255, 255, 255, 0.8);
    transition: all 0.3s;
    padding-left: 45px;
}

.login-input >>> .el-input__prefix {
    left: 15px;
    color: #67C23A;
}

.login-input >>> .el-input__inner:focus {
    border-color: #67C23A;
    box-shadow: 0 0 0 2px rgba(103, 194, 58, 0.2);
    background-color: rgba(255, 255, 255, 1);
}

.login-actions {
    margin: 30px 0 10px 0;
    text-align: center;
}

.login-button {
    width: 120px;
    height: 48px;
    border-radius: 10px;
    background-image: linear-gradient(135deg, #67C23A 0%, #95D475 100%);
    border: none;
    font-size: 16px;
    font-weight: 500;
    transition: all 0.3s;
    margin-right: 15px;
}

.login-button:hover {
    transform: translateY(-2px) scale(1.02);
    box-shadow: 0 5px 15px rgba(103, 194, 58, 0.4);
}

.register-button {
    width: 120px;
    height: 48px;
    border-radius: 10px;
    background-image: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 100%);
    border: none;
    font-size: 16px;
    font-weight: 500;
    transition: all 0.3s;
}

.register-button:hover {
    transform: translateY(-2px) scale(1.02);
    box-shadow: 0 5px 15px rgba(255, 154, 158, 0.4);
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px) rotateX(10deg);
    }
    to {
        opacity: 1;
        transform: translateY(0) rotateX(0);
    }
}

/* 适配移动设备 */
@media screen and (max-width: 480px) {
    .login-box {
        width: 90%;
        max-width: 360px;
        padding: 30px 20px;
    }
    
    .login-button, .register-button {
        width: 100px;
    }
}
</style>
