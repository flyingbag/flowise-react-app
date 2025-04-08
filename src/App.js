import React from "react";
import { FullPageChat } from "flowise-embed-react";

const App = () => {
    return (
        <FullPageChat
            chatflowid="00000000-0000-0000-0000-000000000000"
            apiHost="http://localhost:3000"
        />
    );
};

export default App;