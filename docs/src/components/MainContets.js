import React from "react";
import styled from "styled-components";
import IntroContents from "./IntroContents";
import Second from "./Second";
import Slider from "./Slider";
import Review from "./Review";
import AboutContents from "./AboutContents";
import PricingPolicy from "./PricingPolicy";
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
      <Slider />
      <PricingPolicy />
      <Review />
      <Fotter />
    </>
  );
};

export default MainContets;
