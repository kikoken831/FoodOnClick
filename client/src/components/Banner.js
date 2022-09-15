import React, { useState, useEffect } from "react";
import { ReactSession } from "react-client-session";
const Banner = () => {
const [dateState, setDateState] = useState(new Date());
  useEffect(() => {
    setInterval(() => setDateState(new Date()), 1000);
  }, []);
  return (
    <div className="mt-1 bg-bluegray-50 text-gray-700 p-3 flex justify-content-between lg:justify-content-center align-items-center flex-wrap">
          <div className="font-bold mr-8">
            👋 Welcome {ReactSession.get("name")} 👋 to{" "}
            {ReactSession.get("role")} dashboard!{" "}
          </div>
          <div className="align-items-center hidden lg:flex">
            <span className="line-height-3">
              {dateState.toLocaleString("en-US", {
                hour: "numeric",
                minute: "numeric",
                second: "numeric",
                hour12: false,
              })}
            </span>
          </div>
        </div>
  )
}

export default Banner