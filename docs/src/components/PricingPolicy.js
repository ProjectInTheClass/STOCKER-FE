import React, { useEffect } from "react";
import styled from "styled-components";
import Aos from "aos";
import "aos/dist/aos.css";

const Container = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  margin-top: 1.5rem;
  margin-bottom: 2rem;
`;

const ContentsGroup = styled.div`
  width: 1100px;
  display: flex;
  justify-content: center;
  @media screen and (max-width: 767px) {
    width: 100%;
    flex-direction: column;
    align-items: center;
  }
`;

const Boxex = styled.div`
  display: flex;
  justify-content: center;
  flex-direction: column;
  text-align: center;
  width: 200px;
  font-weight: bold;

  & + & {
    margin-left: 5rem;
  }
  .spanHead {
    margin-bottom: 0;
  }
  .spanText {
    padding: 0;
    padding: 0.25rem 0;
    background: #74c0fc;
    box-shadow: 5px 5px 10px #adb5bd;
    margin: 1rem 0 0 0;
    font-size: 2.5rem;
    font-weight: bold;
    border: none;
    color: white;
    border-radius: 4px;
  }
  @media screen and (max-width: 767px) {
    .spanText {
      font-size: 2.125rem;
      height: 40px;
    }
    & + & {
      margin-left: 0;
    }
  }
`;

const PricingPolicy = () => {
  useEffect(() => {
    Aos.init({ duration: 1500 });
  }, []);

  return (
    <Container>
      <ContentsGroup data-aos="zoom-in">
        {/* <Boxex>
          <p className="spanHead">월 사용자 수</p>
          <p className="spanText">1000명</p>
        </Boxex>
        <Boxex>
          <p className="spanHead">평균 가격정책</p>
          <p className="spanText">35,000원</p>
        </Boxex>
        <Boxex>
          <p className="spanHead">고객 불만족도</p>
          <p className="spanText">1.234%</p>
        </Boxex> */}
      </ContentsGroup>
    </Container>
  );
};

export default PricingPolicy;
