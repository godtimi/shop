<template>
    <div class="wrapper">
        <div class="background-animation"></div>
        <div class="main">
            <div class="register-container">
                <div class="register-box">
                    <div class="register-header">
                        <div class="register-logo">
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
                        <div class="register-title">羊羊生鲜</div>
                        <div class="register-subtitle">新用户注册</div>
                    </div>
                    <el-form :model="user" :rules="rules" ref="registerForm" class="register-form">
                        <el-form-item prop="username">
                            <el-input size="medium" class="register-input" prefix-icon="el-icon-user"
                                      v-model="user.username" placeholder="用户名"></el-input>
                        </el-form-item>
                        <el-form-item prop="password">
                            <el-input size="medium" class="register-input" prefix-icon="el-icon-lock" show-password
                                      v-model="user.password" placeholder="密码"></el-input>
                        </el-form-item>
                        <el-form-item prop="confirmPassword">
                            <el-input size="medium" class="register-input" prefix-icon="el-icon-lock" show-password
                                      v-model="user.confirmPassword" placeholder="确认密码"></el-input>
                        </el-form-item>
                        <el-form-item prop="email">
                            <el-input size="medium" class="register-input" prefix-icon="el-icon-message"
                                      v-model="user.email" placeholder="邮箱"></el-input>
                        </el-form-item>
                        <el-form-item prop="phone">
                            <el-input size="medium" class="register-input" prefix-icon="el-icon-phone"
                                      v-model="user.phone" placeholder="电话"></el-input>
                        </el-form-item>
                        <el-form-item class="register-actions">
                            <el-button type="primary" size="medium" class="register-button" autocomplete="off" @click="register">注册</el-button>
                            <el-button size="medium" class="login-button" autocomplete="off" @click="$router.push('/login')">返回登录</el-button>
                        </el-form-item>
                    </el-form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "Register",
    data() {
        const validatePass = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入密码'));
            } else {
                if (this.user.confirmPassword !== '') {
                    this.$refs.registerForm.validateField('confirmPassword');
                }
                callback();
            }
        };
        const validatePass2 = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请再次输入密码'));
            } else if (value !== this.user.password) {
                callback(new Error('两次输入密码不一致!'));
            } else {
                callback();
            }
        };
        return {
            user: {confirmPassword: ''},
            rules: {
                username: [
                    {required: true, message: '请输入用户名', trigger: 'blur'},
                    {min: 3, max: 10, message: '长度在 3 到 10 个字符', trigger: 'blur'}
                ],
                password: [
                    {required: true, message: '请输入密码', trigger: 'blur'},
                    {min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur'},
                    {validator: validatePass, trigger: 'blur'}
                ],
                confirmPassword: [
                    {required: true, message: '请再次输入密码', trigger: 'blur'},
                    {min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur'},
                    {validator: validatePass2, trigger: 'blur'}
                ],
                email: [
                    {required: true, message: '请输入邮箱', trigger: 'blur'},
                    {type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change']}
                ],
                phone: [
                    {required: true, message: '请输入电话', trigger: 'blur'},
                    {pattern: /^1[3-9]\d{9}$/, message: '请输入正确的手机号码', trigger: 'blur'}
                ],
            }
        }
    },
    methods: {
        register() {
            this.$refs['registerForm'].validate((valid) => {
                if (valid) {  // 表单校验合法
                    let params = {...this.user}
                    delete params.confirmPassword
                    this.request.post("/user/register", params).then(res => {
                        if (res.code === '200') {
                            this.$message.success("注册成功")
                            this.$router.push("/login")
                        } else {
                            this.$message.error(res.msg)
                        }
                    })
                }
            });
        }
    },
    created() {
        let that = this
        document.onkeydown = function (e) {
            e = window.event || e
            if (that.$route.path === '/register' && (e.code === 'Enter' || e.code === 'enter')) {
                that.register()
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

.register-container {
    position: relative;
    perspective: 1000px;
}

.register-box {
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

.register-header {
    text-align: center;
    margin-bottom: 30px;
}

.register-logo {
    width: 80px;
    height: 80px;
    margin: 0 auto 15px;
}

.logo-svg {
    width: 100%;
    height: 100%;
    filter: drop-shadow(0 2px 5px rgba(0, 0, 0, 0.2));
}

.register-title {
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 5px;
    background: linear-gradient(to right, #67C23A, #95D475);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

.register-subtitle {
    font-size: 14px;
    color: #909399;
    margin-bottom: 20px;
}

.register-form {
    margin-top: 20px;
}

.register-input {
    margin: 15px 0;
}

.register-input >>> .el-input__inner {
    height: 50px;
    border-radius: 10px;
    border: 1px solid rgba(103, 194, 58, 0.2);
    background-color: rgba(255, 255, 255, 0.8);
    transition: all 0.3s;
    padding-left: 45px;
}

.register-input >>> .el-input__prefix {
    left: 15px;
    color: #67C23A;
}

.register-input >>> .el-input__inner:focus {
    border-color: #67C23A;
    box-shadow: 0 0 0 2px rgba(103, 194, 58, 0.2);
    background-color: rgba(255, 255, 255, 1);
}

.register-actions {
    margin: 30px 0 10px 0;
    text-align: center;
}

.register-button {
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

.register-button:hover {
    transform: translateY(-2px) scale(1.02);
    box-shadow: 0 5px 15px rgba(103, 194, 58, 0.4);
}

.login-button {
    width: 120px;
    height: 48px;
    border-radius: 10px;
    background-image: linear-gradient(135deg, #e0c3fc 0%, #8ec5fc 100%);
    border: none;
    font-size: 16px;
    font-weight: 500;
    transition: all 0.3s;
    color: white;
}

.login-button:hover {
    transform: translateY(-2px) scale(1.02);
    box-shadow: 0 5px 15px rgba(142, 197, 252, 0.4);
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
    .register-box {
        width: 90%;
        max-width: 360px;
        padding: 30px 20px;
    }
    
    .register-button, .login-button {
        width: 100px;
    }
}
</style>
