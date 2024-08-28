import {
    createBrowserRouter,
} from "react-router-dom";
import Main from "../layout/Main";
import Login from "../pages/Login";
import BankerDashboard from "../pages/BankerDashboard";
import BankerOverview from "../pages/BankerOverview";

export const router = createBrowserRouter([
    {
        path: "/",
        element: <Main></Main>,
        children: [
            {
                path: '/',
                element: <Login></Login>
            },
        ]
    },
    {
        path: '/banker',
        element: <BankerDashboard></BankerDashboard>,
        children: [
            {
                path: '/banker/overview',
                element: <BankerOverview></BankerOverview>
            }
        ]
    }
]);