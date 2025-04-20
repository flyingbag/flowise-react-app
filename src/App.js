import React from "react";
import { FullPageChat } from "flowise-embed-react";

const App = () => {
    return (
        <FullPageChat
            chatflowid={process.env.REACT_APP_CHATFLOW_ID}
            apiHost={process.env.REACT_APP_API_HOST}
        />
    );
};

export default App;