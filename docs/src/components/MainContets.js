import React from "react";
import IntroContents from "./IntroContents";
import Second from "./Second";
import AboutContents from "./AboutContents";
import StockerHome from "./StockerHome";
import StockerHomeContents from "./StockerHomeContents";
import StockerData from "./StockerData";
import Developer from "./Developer";
import Fotter from "./Fotter";
import ADS from "./ADS";
import AppDesc from "./AppDesc";
import AppDesc2 from "./AppDesc2";

const MainContets = () => {
  return (
    <>
      <IntroContents />
      <Second />
      <ADS />
      <AppDesc />
      <AppDesc2 />
      <AboutContents />
      <StockerHome />
      <StockerHomeContents />
      <StockerData />
      <Developer />
      <Fotter />
    </>
  );
};

export default MainContets;
