import React from "react";
import styled, { css } from "styled-components";
import backgroundImg from "../img/review.png";
import { MdRateReview } from "react-icons/md";

const InnerOpacityBlockStyle = css`
  align-items: start;
  height: 118px;
  padding: 16px;
  background-color: rgba(0, 0, 0, 0.6);
  transition: 0.5s ease-in;
  &:hover {
    height: 232px;
    background-color: rgba(0, 0, 0, 0.7);
  }
`;

const ReviewContainer = styled.div`
  width: 100%;
  height: 400px;
  background: #f8f9fa;
  background: url(${(props) => props.img});
`;

const OpacityBlock = styled.div`
  display: flex;
  border-radius: 6px;
  flex-direction: column;
  width: 100%;
  height: 400px;
  background-color: rgba(0, 0, 0, 0.3);
  z-index: 5;
  display: flex;
  justify-content: center;
  align-items: center;
  ${(props) =>
    props.isOutter !== true &&
    css`
      ${InnerOpacityBlockStyle}
    `}
`;

const ReviewDesc = styled.div`
  width: 100%;
  color: white;
  text-align: end;
`;

const ReviewBoxGroup = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
`;

const ReviewBoxes = styled.div`
  display: flex;
  justify-content: center;
  width: 350px;
  height: 150px;
  border: 2px solid #ffd43b;
  border-radius: 6px;
  transition: 0.5s ease-in;
  &:hover {
    height: 264px;
  }
  & + & {
    margin-left: 1rem;
  }
`;

const ReviewBoxesContents = styled.div`
  width: 100%;
  overflow: hidden;
  word-wrap: break-word;
  color: white;
  font-size: 1.125rem;
`;

const ReviewHeader = styled.div`
  width: 100%;
  color: white;
  border-bottom: 2px solid white;
  margin-bottom: 1.5rem;
  font-size: 1.375rem;
`;

const Review = () => {
  return (
    <>
      <ReviewContainer img={backgroundImg}>
        <OpacityBlock isOutter={true}>
          <ReviewDesc>
            <h1>주저 없는 선택을 위해&nbsp;&nbsp;</h1>
            <p>생생한 후기를 들려드립니다&nbsp;&nbsp;</p>
          </ReviewDesc>
          <ReviewBoxGroup>
            {/* <ReviewBoxes>
              <OpacityBlock isOutter={false}>
                <ReviewBoxesContents>
                  <ReviewHeader>Admin 님</ReviewHeader>This is my fight song
                  Take back my life song Prove I'm alright song My power's
                  turned on Starting right now I'll be strong I'll play my fight
                  song And I don't really care if nobody else believes 'Cause
                  I've still got a lot of fight left in me
                </ReviewBoxesContents>
              </OpacityBlock>
            </ReviewBoxes> */}
          </ReviewBoxGroup>
        </OpacityBlock>
      </ReviewContainer>
    </>
  );
};

export default Review;
