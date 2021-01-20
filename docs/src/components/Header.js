import React, { useState, useEffect } from "react";
import styled from "styled-components";
import logoImg from "../img/es_logo.png";
import { GiHamburgerMenu } from "react-icons/gi";
import { ScrollTo } from "react-scroll-to";

const HeaderLayoutContainer = styled.div`
  display: flex;
  justify-content: center;
  border-bottom: 1px solid #dee2e6;
  width: 100%;
  position: fixed;
  top: 0;
  background: white;
  z-index: 99;
  transition: 5s ease-in;
  opacity: 0.85;
`;

const PageHeader = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 1300px;
  font-size: 1.53125rem;
  font-weight: bold;
  @media all and (max-width: 767px) {
    justify-content: center;
  }
`;

const BrandContainer = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  padding-left: 1rem;
  img {
    width: 4rem;
  }
  a {
    font-size: 1.125rem;
    text-decoration: none;
    color: #343a40;
  }

  @media all and (max-width: 991px) {
    img {
      width: 3rem;
    }
    a {
      font-size: 1rem;
    }
  }
  @media all and (max-width: 767px) {
    padding-left: 0;
  }
`;

const NavigationContainer = styled.ul`
  display: flex;
  justify-content: center;
  list-style: none;
  margin-right: 1rem;

  li {
    font-size: 1rem;
    color: #343a40;
  }
  @media all and (min-width: 768px) and (max-width: 991px) {
    margin: 0.75rem 0;
    margin-right: 1rem;
    li {
      font-size: 0.875rem;
    }
  }

  @media all and (max-width: 767px) {
    display: none;
  }
  li + li {
    margin-left: 1rem;
  }
`;

const NaviMenuBtn = styled.div`
  display: none;
  margin-right: 1rem;
  cursor: pointer;
  @media all and (max-width: 767px) {
    display: flex;
    position: absolute;
    right: 5px;
    justify-content: center;
    align-items: center;
  }
`;

const ToggleMenu = styled.ul`
  display: flex;
  z-index: 98;
  flex-direction: column;
  justify-content: center;
  position: fixed;
  margin-top: 48px;
  list-style: none;
  width: 100%;
  padding-left: 0;
  border-bottom: 1px solid #dee2e6;
  background: white;
  border-bottom-left-radius: 4px;
  border-bottom-right-radius: 4px;

  @media screen and (min-width: 768px) and (max-width: 991px) {
    display: none;
  }
  li {
    width: 100%;
    text-align: center;
    border-bottom: 1px solid #dee2e6;
    padding: 5px 0;
    color: #343a40;
  }
`;

const useScroll = () => {
  const [state, setState] = useState({
    x: 0,
    y: 0,
  });
  const onScroll = () => {
    setState({ y: window.scrollY, x: window.scrollX });
  };
  useEffect(() => {
    window.addEventListener("scroll", onScroll);
    return () => window.removeEventListener("scroll", onScroll);
  }, []);
  return state;
};

const Header = () => {
  const [open, setOpen] = useState(false);
  const { y } = useScroll();
  const onToggle = () => {
    setOpen(!open);
  };

  return (
    <>
      <HeaderLayoutContainer style={{ display: y > 0 ? "flex" : "none" }}>
        <PageHeader>
          <BrandContainer>
            <img src={logoImg} />
            <a href="/">EverySports</a>
          </BrandContainer>
          <NavigationContainer>
            {/* <li>회사소개</li>
            <li>ES 가이드</li>
            <li>Contact</li> */}
            <li>
              <ScrollTo>
                {({ scroll }) => (
                  <a onClick={() => scroll({ x: 0, y: 734 })}>desktop</a>
                )}
              </ScrollTo>
            </li>
            <li>
              <ScrollTo>
                {({ scroll }) => (
                  <a onClick={() => scroll({ x: 0, y: 758 })}>tablet</a>
                )}
              </ScrollTo>
            </li>
          </NavigationContainer>
          <NaviMenuBtn onClick={onToggle}>
            <GiHamburgerMenu />
          </NaviMenuBtn>
        </PageHeader>
      </HeaderLayoutContainer>
      {open === true && y > 0 && (
        <ToggleMenu>
          {/* <li>회사소개</li>
          <li>ES 가이드</li>
          <li>Contact</li> */}
        </ToggleMenu>
      )}
      {/* <MenuNavi /> */}
    </>
  );
};

export default Header;
