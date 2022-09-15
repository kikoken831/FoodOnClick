import React, { useState, useEffect } from "react";
import { ReactSession } from "react-client-session";
import Nav from "./Nav";
import Banner from "./Banner";
import { Link, useNavigate } from "react-router-dom";
import Body from "./Body";
export const Home = () => {
  if (!ReactSession.get("loggedOut")) {
    return (
      <>
        <Nav></Nav>
        <Banner></Banner>
        <Body></Body>
      </>
    );
  } else {
    return (
      <>
        <div>Logged out</div>
      </>
    );
  }
};
