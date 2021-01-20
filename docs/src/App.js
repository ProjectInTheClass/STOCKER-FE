import React from "react";
import { Route } from "react-router-dom";
import { createGlobalStyle } from "styled-components";
import Header from "./components/Header";
import MainContets from "./components/MainContets";

const GlobalStyle = createGlobalStyle`
  body{
    @import url("https://fonts.googleapis.com/css2?family=Fira+Mono:wght@500&display=swap");
    font-family: "Fira Mono";
    margin : 0;
  } 
  a{
    text-decoration : none;
  }
  ul{
    list-style : none;
    padding-left : 0;
  }
`;
function App() {
  return (
    <>
      <GlobalStyle />
      <Route path="/" component={Header} />
      <Route path="/" component={MainContets} />
    </>
  );
}

export default App;
