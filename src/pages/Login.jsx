const Login = () => {
    return (
        <div className="bg-[#0C8CE9] h-screen w-full flex flex-col justify-center items-center gap-5">
            <div>
                <img src="../../public/logo.svg" alt="logo" className="w-[150px]" />
            </div>
            <div className="flex flex-col gap-3 w-[30%] mx-auto">
                <div>
                    <input type="text" placeholder="Username" className="input input-bordered w-full" />
                </div>
                <div>
                    <input type="password" placeholder="Password" className="input input-bordered w-full" />
                </div>
                <div className="flex flex-col gap-3">
                    <button className="btn w-full font-semibold text-[#2148C0]">LOGIN</button>
                </div>
                <div className="text-right text-white font-semibold">
                    <h3>
                        <a href="#">Forget Password</a>
                    </h3>
                </div>
            </div>
        </div>
    );
};

export default Login;