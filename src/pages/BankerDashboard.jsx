import { Outlet } from "react-router-dom";

const BankerDashboard = () => {
    return (
        <div>
            <div className="w-64 min-h-full bg-[#0C8CE9]">
                <h1>menu</h1>
            </div>
            <div>
                <Outlet></Outlet>
            </div>
        </div>
    );
};

export default BankerDashboard;