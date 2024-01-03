import { Outlet } from 'react-router-dom';
import TitleAsciiArt from '../components/TitleAsciiArt'
import Footer from '../components/Footer';

function MainLayout() {
    return (
        <div className="MainLayout">
            <TitleAsciiArt/>
            <Outlet/>
            <Footer/>
        </div>
    );
}

export default MainLayout;