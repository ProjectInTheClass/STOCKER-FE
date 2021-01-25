import React from "react";
import styled from "styled-components";
import IntroContents from "./IntroContents";
import Second from "./Second";
import Slider from "./Slider";
import Review from "./Review";
import AboutContents from "./AboutContents";
import PricingPolicy from "./PricingPolicy";
import StockerHome from "./StockerHome";
import StockerHomeContents from "./StockerHomeContents";
import StockerData from "./StockerData";
import Developer from "./Developer";
import Map from "./Map";
import Fotter from "./Fotter";

const tempBox = styled.div`
  width: 500px;
  height: 500px;
`;

const MainContets = () => {
  return (
    <>
      <IntroContents />
      <Second />
      <AboutContents />
      <StockerHome />
      <StockerHomeContents />
      <StockerData />
      <Developer />
      {/* <Slider /> */}
      {/* <PricingPolicy /> */}
      {/* <Review /> */}
      <Fotter />
    </>
  );
};

export default MainContets;
