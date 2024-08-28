import {
    createBrowserRouter,
} from "react-router-dom";
import Main from "../layout/Main";
import Login from "../pages/Login";
import BankerDashboard from "../pages/BankerDashboard";

export const router = createBrowserRouter([
    {
        path: "/",
        element: <Main></Main>,
        children: [
            {
                path: '/',
                element: <Login></Login>
            },
            {
                path: '/banker/overview',
                element: <BankerDashboard></BankerDashboard>
            }
        ]
    },
]);