var Text_Field = React.createClass({
    getInitialState: function () {
        return {value: ' '};
    },
    handleChange: function (e) {
        console.log(e.target.value);
        this.setState({value: event.target.value});
    },
    render: function () {
        return (
            <input
                type="text"
                name = "student"
                id ="id"
                value={this.state.value}
                onChange={this.handleChange}
            />
        );
    }
});