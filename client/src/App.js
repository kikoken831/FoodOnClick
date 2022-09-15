import React from "react";
import { Route, Routes } from "react-router-dom";
import { Home } from "./components/Home";
import { Kitchen } from "./components/Kitchen";
import { Login } from "./components/Login";
import { Register } from "./components/Register";
import { ReactSession } from "react-client-session";
import "./App.scss";
function App() {
  ReactSession.setStoreType("localStorage");
  return (
    <>
      <Routes>
        <Route path="/" element={<Login />}></Route>
        <Route path="/home" element={<Home />}></Route>
        <Route path="/register" element={<Register />}></Route>
        <Route path="/home/kitchen" element={<Kitchen />}></Route>
      </Routes>
    </>
  );
}

export default App;

/*
  const [backendData, setBackendData] = useState([{}])

  useEffect(() => {
    fetch("/api").then(
      response => response.json()
    ).then(
      data => {
        setBackendData(data)
      }
    )
  }, [])


      {(typeof(backendData.users) === 'undefined') ?
       (<p>Loading</p>) :
        (backendData.users.map((user,i) => {
          return <p key={i}>{user}</p>
        }))
        }
*/
