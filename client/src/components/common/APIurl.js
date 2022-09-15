const API_URL =
  process.env.NODE_ENV === "production"
    ? "https://food-on-click-uowfyp.herokuapp.com/"
    : "http://localhost:8000";
export default API_URL;