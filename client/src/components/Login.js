import React, { useState, useRef } from "react";
import { InputText } from "primereact/inputtext";
import { Button } from "primereact/button";
import "primereact/resources/themes/lara-light-indigo/theme.css"; //theme
import "primereact/resources/primereact.min.css"; //core css
import "primeicons/primeicons.css"; //icons
import { Link, useNavigate } from "react-router-dom";
import { Messages } from "primereact/messages";
import { ReactSession } from "react-client-session";
import API_URL from "./common/APIurl";
export const Login = () => {
  const [input, setInput] = useState({});
  var messages = useRef(null);

  const navigate = useNavigate();
  function handleChange(event) {
    const { name, value } = event.target;
    setInput((prevValue) => {
      return { ...prevValue, [name]: value };
    });
  }

  function submit() {
    // POST request using fetch inside useEffect React hook
    const requestOptions = {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ email: input.email, password: input.password }),
    };

    fetch(`${API_URL}/api/login`, requestOptions).then((response) => {
      if (response.status === 200) {
        console.log("Valid login");
        response.json().then((data) => {
          ReactSession.set("user_id", data.user_id)
          ReactSession.set("name", data.name);
          ReactSession.set("email", data.email);
          ReactSession.set("role", data.role);
          ReactSession.set("loggedOut", false);
          navigate("/home");
        });

      } else if (response.status === 401) {
        console.log("invalid login");
        messages.current.show({
          severity: "error",
          summary: "Invalid Credentials",
        });
      } else {
        console.log("Error");
      }
    });
  }

  return (
    <>
      <div
        className="surface-card surface-ground p-4 shadow-2 border-round w-full lg:w-6"
        style={{
          position: "fixed",
          left: "50%",
          top: "50%",
          transform: "translate(-50%, -50%)",
        }}
      >
        <Messages className="p4" ref={messages}></Messages>
        <div className="text-center mb-5">
          <img
            className="mt-4 mb-4 rounded"
            src="https://img.freepik.com/free-vector/yentafo-noodles-soup-bowl-tasty-asian-food-hand-drawn-cartoon-art-illustration_56104-1118.jpg?w=1480&t=st=1661681404~exp=1661682004~hmac=288a1f486ac5b438d372254919cad559714031b1204d3a1a2f92316d07847a3b"
            alt=""
            width="125"
            height="125"
          />
          <div className="text-900 text-3xl font-medium mb-3">
            Welcome To FoodOnClick!
          </div>
          <span className="text-600 font-medium line-height-3">
            Don't have an account?
          </span>

          <Link
            className="font-medium no-underline ml-2 text-blue-500 cursor-pointer"
            to={"/register"}
          >
            Create today!
          </Link>
        </div>

        <div>
          <label htmlFor="email" className="block text-900 font-medium mb-2">
            Email
          </label>
          <InputText
            type="text"
            className="w-full mb-3"
            name="email"
            onChange={handleChange}
          />

          <label htmlFor="password" className="block text-900 font-medium mb-2">
            Password
          </label>
          <InputText
            type="password"
            className="w-full mb-3"
            name="password"
            onChange={handleChange}
          />

          <div className="flex align-items-center justify-content-between mb-6">
            <Link
              className="font-medium no-underline ml-2 text-blue-500 text-right cursor-pointer"
              to={"/"}
            >
              Forgot your password?
            </Link>
          </div>

          <Button
            label="Sign In"
            icon="pi pi-user"
            className="w-full"
            onClick={submit}
          />
        </div>
      </div>
    </>
  );
};
