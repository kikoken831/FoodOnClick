import { Menubar } from "primereact/menubar";
import { ReactSession } from "react-client-session";
import React from "react";
import { Link, useNavigate } from "react-router-dom";

// import { InputText } from "primereact/inputtext";
import { Button } from "primereact/button";
const Nav = () => {
  const items = [
    {
      label: "Inventory",
      icon: "pi pi-fw pi-list",
      items: [
        {
          label: "Manage",
          icon: "pi pi-fw pi-plus",
          command: (e) => {
            goToInventoryManagement();
          },
        },

        // {
        //   separator: true,
        // },
      ],
    },
    {
      label: "Menu",
      icon: "pi pi-fw pi-shopping-bag",
      items: [
        {
          label: "Manage",
          icon: "pi pi-fw pi-tags",
        },
      ],
    },
    {
      label: "Riders",
      icon: "pi pi-fw pi-user",
      items: [
        {
          label: "New",
          icon: "pi pi-fw pi-user-plus",
        },
        {
          label: "Delete",
          icon: "pi pi-fw pi-user-minus",
        },
        {
          label: "Search",
          icon: "pi pi-fw pi-users",
          items: [
            {
              label: "Filter",
              icon: "pi pi-fw pi-filter",
              items: [
                {
                  label: "Print",
                  icon: "pi pi-fw pi-print",
                },
              ],
            },
            {
              icon: "pi pi-fw pi-bars",
              label: "List",
            },
          ],
        },
      ],
    },
    {
      label: "Reservations",
      icon: "pi pi-fw pi-calendar",
      items: [
        {
          label: "Create",
          icon: "pi pi-fw pi-pencil",
          items: [
            {
              label: "Create",
              icon: "pi pi-fw pi-calendar-plus",
            },
            {
              label: "View",
              icon: "pi pi-fw pi-calendar-minus",
            },
          ],
        },
        {
          label: "Manage",
          icon: "pi pi-fw pi-calendar-times",
          items: [
            {
              label: "Approve",
              icon: "pi pi-fw pi-calendar-minus",
            },
          ],
        },
      ],
    },
  ];

  const navigate = useNavigate();

  function goHome(){
    navigate("/home");
  }

  function logout() {
    ReactSession.remove("user_id");
    ReactSession.remove("name");
    ReactSession.remove("email");
    ReactSession.remove("role");
    ReactSession.set("loggedOut", true);
    console.log(ReactSession.get("name"));
    console.log(ReactSession.get("email"));
    console.log(ReactSession.get("role"));
    console.log(ReactSession.get("user_id"));
    navigate("/");
  }
  function goToInventoryManagement() {
    console.log("clicked");
    navigate("/home/kitchen");
  }
  return (
    <>
      <Menubar
        toggleevent="click"
        model={items}
        start={
          <img
            src="https://img.freepik.com/free-vector/yentafo-noodles-soup-bowl-tasty-asian-food-hand-drawn-cartoon-art-illustration_56104-1118.jpg?w=1480&t=st=1661681404~exp=1661682004~hmac=288a1f486ac5b438d372254919cad559714031b1204d3a1a2f92316d07847a3b"
            height="40"
            className="p-mr-2"
            alt="brand logo"
            onClick={goHome}
          ></img>
        }
        end={<Button label="Logout" icon="pi pi-power-off" onClick={logout} />}
      />
    </>
  );
};

export default Nav;
