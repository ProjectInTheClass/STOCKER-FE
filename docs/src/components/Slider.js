import React, { useState, useEffect, useRef } from "react";
import styled from "styled-components";
import PTPose from "../img/PTPose.gif";
import Code from "../img/code.jpg";
import Slide from "./Slide";

const Container = styled.div`
  width: 100%;
  display: flex;
  justify-content: center;
  background: #f8f9fa;
  padding: 1rem 0;
`;

const SliderContentsGroup = styled.div`
  display: flex;
  justify-content: center;
  flex-direction: column;
`;

const SliderOutterContainer = styled.div`
  width: 818px;
  overflow: hidden;

  @media screen and (min-width: 768px) and (max-width: 991px) {
    width: 700px;
  }

  @media screen and (max-width: 767px) {
    width: 250px;
  }
`;

const SliderInnerContainer = styled.div`
  display: flex;
`;

const CurrentButton = styled.button`
  width: 0.85rem;
  height: 0.85rem;
  background: #495057;
  border: none;
  padding: 0;
  cursor: pointer;
  outline: none;
  margin-left: 0.5rem;
`;

const AnotherButton = styled.button`
  cursor: pointer;
  width: 0.85rem;
  height: 0.85rem;
  background: #ced4da;
  border: none;
  padding: 0;
  transition: 0.25s ease-in;
  outline: none;
  margin-left: 0.5rem;
  &:hover {
    background: #495057;
  }
`;

const SlideButtonGroup = styled.div`
  display: flex;
  justify-content: center;
  margin-top: 1rem;
`;

const TOTAL_SLIDES = 2;

const initialSlideButton = Array.apply(null, Array(TOTAL_SLIDES + 1)).map(
  Number.prototype.valueOf,
  0
);
initialSlideButton[0] = 1;

const Slider = () => {
  const [slideButton, setSlideButton] = useState(initialSlideButton);
  const slideRef = useRef(null);

  useEffect(() => {
    slideRef.current.style.transition = "all 0.5s ease-in-out";
    slideRef.current.style.transform = `translateX(-${slideButton.indexOf(
      1
    )}00%)`;
  }, [slideButton]);

  const onButtonSlide = (e) => {
    const nextSlideIndex = e.target.value;
    const nextSlideState = Array.apply(null, Array(TOTAL_SLIDES + 1)).map(
      Number.prototype.valueOf,
      0
    );
    nextSlideState[nextSlideIndex] = 1;
    setSlideButton(nextSlideState);
  };

  return (
    <Container>
      <SliderContentsGroup>
        <SliderOutterContainer>
          <SliderInnerContainer ref={slideRef}>
            <Slide img={PTPose} value="AI" />
            <Slide img={PTPose} value="Front" />
            <Slide img={Code} value="Back" />
          </SliderInnerContainer>
        </SliderOutterContainer>

        <SlideButtonGroup>
          {slideButton.map((value, index) =>
            value === 1 ? (
              <CurrentButton
                key={index}
                onClick={onButtonSlide}
                value={index}
              />
            ) : (
              <AnotherButton
                key={index}
                onClick={onButtonSlide}
                value={index}
              />
            )
          )}
        </SlideButtonGroup>
      </SliderContentsGroup>
    </Container>
  );
};

export default Slider;
