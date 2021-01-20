import React from "react";
import styled, { css } from "styled-components";
import { MdKeyboardArrowDown, MdNoEncryption } from "react-icons/md";

const NavigationContainer = styled.div`
  width: 100%;
  display: flex;
  justify-content: center;
  border-bottom: 1px solid #dee2e6;
  position: absolute;
  top: 4rem;
  background: white;
  z-index: 7;
`;

const NavigationContents = styled.div`
  @media (max-width: 1919px) {
    width: 1376px;
  }
  width: 1728px;
`;

const NavigationMenuGroup = styled.div`
  display: flex;
`;

const MenuBorderBottom = styled.div`
  position: absolute;
  width: 6rem;
  height: 0px;
  background: rgb(32, 201, 151);
  box-sizing: border-box;
`;

const Menu = styled.div`
  padding: 0.275rem 0;
  display: flex;
  cursor: pointer;
  width: 6rem;
  justify-content: center;
  align-items: center;
  border-bottom: 1px solid white;
  &:hover {
    transition: 0.8s ease-in;
    border-bottom: 1px solid #868e96;
  }
`;

const MenuDropDown = styled.ul`
  display: none;
  text-align: center;
  width: 6rem;
  border: none;
  border-radius: 4px;
  background: white;
  position: absolute;
  list-style: none;
  padding: 0;
  margin: 0;
  z-index: 10;
  li {
    border-radius: 4px;
    cursor: pointer;
    padding: 0.25rem;
    &:hover {
      transition: 0.8s ease-in;
      background: #f1f3f5;
    }
  }
`;

const MenuGroup = styled.div`
  &:hover ${MenuDropDown} {
    display: block;
  }
`;

const MenuNavi = () => {
  return (
    <NavigationContainer>
      <NavigationContents>
        <NavigationMenuGroup>
          <MenuGroup>
            <Menu>
              Drop1 <MdKeyboardArrowDown />
            </Menu>
            <MenuDropDown>
              <li>List1</li>
              <li>List2</li>
              <li>List3</li>
              <li>List4</li>
            </MenuDropDown>
          </MenuGroup>
          <MenuGroup>
            <Menu>
              Drop2 <MdKeyboardArrowDown />
            </Menu>
            <MenuDropDown>
              <li>List1</li>
              <li>List2</li>
              <li>List3</li>
              <li>List4</li>
            </MenuDropDown>
          </MenuGroup>
          <MenuGroup>
            <Menu>
              Drop3 <MdKeyboardArrowDown />
            </Menu>
            <MenuDropDown>
              <li>List1</li>
              <li>List2</li>
              <li>List3</li>
              <li>List4</li>
            </MenuDropDown>
          </MenuGroup>
          <MenuGroup>
            <Menu>
              Drop4 <MdKeyboardArrowDown />
            </Menu>
            <MenuDropDown>
              <li>List1</li>
              <li>List2</li>
              <li>List3</li>
              <li>List4</li>
            </MenuDropDown>
          </MenuGroup>
        </NavigationMenuGroup>
        <MenuBorderBottom className="test" />
      </NavigationContents>
    </NavigationContainer>
  );
};

export default MenuNavi;
