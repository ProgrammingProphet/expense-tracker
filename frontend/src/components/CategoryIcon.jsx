import React from 'react';
import PropTypes from 'prop-types';
import * as LuIcons from 'react-icons/lu';

const CategoryIcon = ({ iconName, className = '', color = 'currentColor', size = 24 }) => {
  // If no icon name is provided, use a default package icon
  if (!iconName) {
    return <LuIcons.LuPackage className={className} size={size} color={color} />;
  }

  // Get the icon component from Lucide icons
  const IconComponent = LuIcons[iconName];

  // If the icon exists in Lucide, render it
  if (IconComponent) {
    return <IconComponent className={className} size={size} color={color} />;
  }

  // Fallback: If it was an old emoji (not recommended, but for compatibility)
  // we just render it as text
  if (iconName.length <= 4) {
    return <span className={className} style={{ fontSize: `${size}px` }}>{iconName}</span>;
  }

  // Final fallback
  return <LuIcons.LuPackage className={className} size={size} color={color} />;
};

CategoryIcon.propTypes = {
  iconName: PropTypes.string,
  className: PropTypes.string,
  color: PropTypes.string,
  size: PropTypes.number
};

export default CategoryIcon;

// List of available icons for the selector
export const AVAILABLE_ICONS = [
  { name: 'Salary/Wallet', key: 'LuWallet' },
  { name: 'Income/Trending', key: 'LuTrendingUp' },
  { name: 'Business', key: 'LuBuilding2' },
  { name: 'Freelance/Laptop', key: 'LuLaptop' },
  { name: 'Gift', key: 'LuGift' },
  { name: 'Food/Dining', key: 'LuUtensils' },
  { name: 'ShoppingBag', key: 'LuShoppingBag' },
  { name: 'ShoppingCart', key: 'LuShoppingCart' },
  { name: 'Transportation', key: 'LuCar' },
  { name: 'Entertainment', key: 'LuClapperboard' },
  { name: 'Utilities', key: 'LuLightbulb' },
  { name: 'Healthcare', key: 'LuStethoscope' },
  { name: 'Education', key: 'LuGraduationCap' },
  { name: 'Travel', key: 'LuPlane' },
  { name: 'Home/Rent', key: 'LuHome' },
  { name: 'Savings', key: 'LuPiggyBank' },
  { name: 'Taxes', key: 'LuFileText' },
  { name: 'CreditCard', key: 'LuCreditCard' }
];
