import { NavLink, Outlet } from "react-router-dom";

const BankerDashboard = () => {
    return (
        <div className="flex">
            <div className="w-64 min-h-screen bg-[#0C8CE9] flex flex-col gap-3">
                <div className="w-full flex justify-center mt-10">
                    <img src="../../public/logo.svg" alt="logo" />
                </div>
                <div className="w-full flex justify-center mt-10">
                    <ul className="menu">
                        <li className="text-xl text-white">
                            <NavLink to="/banker/overview" className={({ isActive }) => isActive ? "text-[#1890FF] bg-white" : "text-white bg-[#1890FF]"}>
                                <img src="../../public/overview-icon.svg" alt="nav-icon" className="w-[40px] bg-[#1890FF]"/>
                                Overview
                            </NavLink>
                        </li>
                        <li className="text-xl text-white">
                            <NavLink to="/banker/add_user">
                                <img src="../../public/user_add-icon.svg" alt="nav-icon" className="w-[40px]"/>
                                Add User
                            </NavLink>
                        </li>
                        <li className="text-xl text-white">
                            <NavLink to="/banker/user_info">
                                <img src="../../public/user_info-icon.svg" alt="nav-icon" className="w-[40px]"/>
                                User Info
                            </NavLink>
                        </li>
                        <li className="text-xl text-white">
                            <NavLink to="/banker/loan">
                                <img src="../../public/loan-icon.svg" alt="nav-icon" className="w-[40px]"/>
                                Loan
                            </NavLink>
                        </li>
                        <li className="text-xl text-white">
                            <NavLink to="/banker/transaction">
                                <img src="../../public/transactions-icon.svg" alt="nav-icon" className="w-[40px]"/>
                                Transaction
                            </NavLink>
                        </li>
                        <li className="text-xl text-white">
                            <NavLink to="/banker/analytics">
                                <img src="../../public/analytics-icon.svg" alt="nav-icon" className="w-[40px]"/>
                                Analytics
                            </NavLink>
                        </li>
                    </ul>
                </div>
            </div>
            <div className="flex-1">
                <Outlet></Outlet>
            </div>
        </div>
    );
};

export default BankerDashboard;