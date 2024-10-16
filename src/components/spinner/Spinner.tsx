import React from 'react';
import { LoadingOutlined } from '@ant-design/icons';
import { Spin } from 'antd';

const Spinner: React.FC = () => {
  const antIcon = <LoadingOutlined style={{ fontSize: 64 }} spin />; // Adjust the size as needed

  return (
    <div className="fixed inset-0 flex items-center justify-center bg-white bg-opacity-70 z-50">
      <Spin indicator={antIcon} />
    </div>
  );
};

export default Spinner;
